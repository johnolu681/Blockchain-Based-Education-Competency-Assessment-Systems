;; Assessment Manager Verification Contract
;; Manages who can perform competency assessments

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-unauthorized (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-not-found (err u103))

;; Data structures
(define-map assessment-managers principal
  {
    name: (string-ascii 100),
    institution: (string-ascii 100),
    credentials: (string-ascii 200),
    verified: bool,
    created-at: uint
  })

(define-map manager-permissions principal (list 10 (string-ascii 50)))

;; Read-only functions
(define-read-only (get-manager (manager principal))
  (map-get? assessment-managers manager))

(define-read-only (is-verified-manager (manager principal))
  (match (map-get? assessment-managers manager)
    manager-data (get verified manager-data)
    false))

(define-read-only (get-manager-permissions (manager principal))
  (default-to (list) (map-get? manager-permissions manager)))

;; Public functions
(define-public (register-manager (manager principal) (name (string-ascii 100))
                                (institution (string-ascii 100)) (credentials (string-ascii 200)))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (is-none (map-get? assessment-managers manager)) err-already-exists)
    (ok (map-set assessment-managers manager {
      name: name,
      institution: institution,
      credentials: credentials,
      verified: false,
      created-at: block-height
    }))))

(define-public (verify-manager (manager principal))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (is-some (map-get? assessment-managers manager)) err-not-found)
    (ok (map-set assessment-managers manager
      (merge (unwrap-panic (map-get? assessment-managers manager)) {verified: true})))))

(define-public (set-manager-permissions (manager principal) (permissions (list 10 (string-ascii 50))))
  (begin
    (asserts! (is-eq tx-sender contract-owner) err-owner-only)
    (asserts! (is-verified-manager manager) err-unauthorized)
    (ok (map-set manager-permissions manager permissions))))
