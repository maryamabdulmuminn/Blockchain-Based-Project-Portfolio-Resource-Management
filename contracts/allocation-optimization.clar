;; Allocation Optimization Contract
;; Optimizes resource allocation across projects

(define-constant ERR_UNAUTHORIZED (err u300))
(define-constant ERR_INVALID_ALLOCATION (err u301))
(define-constant ERR_ALLOCATION_NOT_FOUND (err u302))
(define-constant ERR_OPTIMIZATION_FAILED (err u303))

;; Data structures
(define-map allocations uint {
    project-id: uint,
    resource-type: (string-ascii 30),
    allocated-amount: uint,
    priority-score: uint,
    efficiency-score: uint,
    manager: principal,
    allocation-date: uint
})

(define-map optimization-results uint {
    total-projects: uint,
    total-resources: uint,
    efficiency-gain: uint,
    optimization-date: uint,
    algorithm-version: uint
})

(define-data-var allocation-counter uint u0)
(define-data-var optimization-counter uint u0)

;; Public functions
(define-public (create-allocation
    (project-id uint)
    (resource-type (string-ascii 30))
    (amount uint)
    (priority uint)
    (manager principal))
    (let ((allocation-id (+ (var-get allocation-counter) u1)))
        (asserts! (> amount u0) ERR_INVALID_ALLOCATION)
        (asserts! (and (>= priority u1) (<= priority u10)) ERR_INVALID_ALLOCATION)

        (map-set allocations allocation-id {
            project-id: project-id,
            resource-type: resource-type,
            allocated-amount: amount,
            priority-score: priority,
            efficiency-score: u50, ;; Default efficiency score
            manager: manager,
            allocation-date: block-height
        })

        (var-set allocation-counter allocation-id)
        (ok allocation-id)
    )
)

(define-public (optimize-allocation (allocation-id uint) (new-amount uint) (efficiency-score uint))
    (let ((allocation (unwrap! (map-get? allocations allocation-id) ERR_ALLOCATION_NOT_FOUND)))
        (asserts! (> new-amount u0) ERR_INVALID_ALLOCATION)
        (asserts! (<= efficiency-score u100) ERR_INVALID_ALLOCATION)

        (map-set allocations allocation-id (merge allocation {
            allocated-amount: new-amount,
            efficiency-score: efficiency-score
        }))

        (ok true)
    )
)

(define-public (run-optimization-algorithm (project-ids (list 10 uint)))
    (let ((optimization-id (+ (var-get optimization-counter) u1))
          (total-projects (len project-ids)))

        ;; Simple optimization: calculate efficiency gain
        (let ((efficiency-gain (calculate-efficiency-gain project-ids)))
            (map-set optimization-results optimization-id {
                total-projects: total-projects,
                total-resources: (calculate-total-resources project-ids),
                efficiency-gain: efficiency-gain,
                optimization-date: block-height,
                algorithm-version: u1
            })

            (var-set optimization-counter optimization-id)
            (ok optimization-id)
        )
    )
)

;; Private functions
(define-private (calculate-efficiency-gain (project-ids (list 10 uint)))
    ;; Simplified calculation - in real implementation would be more complex
    (* (len project-ids) u5)
)

(define-private (calculate-total-resources (project-ids (list 10 uint)))
    ;; Simplified calculation
    (* (len project-ids) u100)
)

;; Read-only functions
(define-read-only (get-allocation (allocation-id uint))
    (map-get? allocations allocation-id)
)

(define-read-only (get-optimization-result (optimization-id uint))
    (map-get? optimization-results optimization-id)
)

(define-read-only (calculate-allocation-efficiency (allocation-id uint))
    (match (map-get? allocations allocation-id)
        allocation (some (get efficiency-score allocation))
        none
    )
)
