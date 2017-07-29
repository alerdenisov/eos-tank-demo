(module
 (type $FUNCSIG$ijjii (func (param i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$ijjj (func (param i64 i64 i64) (result i32)))
 (type $FUNCSIG$vj (func (param i64)))
 (type $FUNCSIG$ijjjii (func (param i64 i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (import "env" "assert" (func $assert (param i32 i32)))
 (import "env" "load_i64" (func $load_i64 (param i64 i64 i64 i32 i32) (result i32)))
 (import "env" "readMessage" (func $readMessage (param i32 i32) (result i32)))
 (import "env" "remove_i64" (func $remove_i64 (param i64 i64 i64) (result i32)))
 (import "env" "requireAuth" (func $requireAuth (param i64)))
 (import "env" "requireNotice" (func $requireNotice (param i64)))
 (import "env" "store_i64" (func $store_i64 (param i64 i64 i32 i32) (result i32)))
 (table 0 anyfunc)
 (memory $0 1)
 (data (i32.const 4) "\a0\04\00\00")
 (data (i32.const 16) "account\00")
 (data (i32.const 32) "incorrect data\00")
 (data (i32.const 48) "tank\00")
 (data (i32.const 64) "spawn\00")
 (data (i32.const 80) "message shorter than expected\00")
 (data (i32.const 112) "move\00")
 (data (i32.const 128) "fire\00")
 (data (i32.const 144) "share\00")
 (export "memory" (memory $0))
 (export "_ZN8TankDemo9save_tankEyRKNS_4TankE" (func $_ZN8TankDemo9save_tankEyRKNS_4TankE))
 (export "_ZN8TankDemo9move_tankERNS_4TankEll" (func $_ZN8TankDemo9move_tankERNS_4TankEll))
 (export "_ZN8TankDemo16apply_spawn_tankERKNS_10CoordinateE" (func $_ZN8TankDemo16apply_spawn_tankERKNS_10CoordinateE))
 (export "_ZN8TankDemo15apply_move_tankERKNS_10CoordinateE" (func $_ZN8TankDemo15apply_move_tankERKNS_10CoordinateE))
 (export "_ZN8TankDemo10apply_fireERKNS_8InteractE" (func $_ZN8TankDemo10apply_fireERKNS_8InteractE))
 (export "_ZN8TankDemo11apply_shareERKNS_8InteractE" (func $_ZN8TankDemo11apply_shareERKNS_8InteractE))
 (export "init" (func $init))
 (export "apply" (func $apply))
 (func $_ZN8TankDemo9save_tankEyRKNS_4TankE (param $0 i64) (param $1 i32)
  (drop
   (call $store_i64
    (get_local $0)
    (i64.const 632468476610478080)
    (get_local $1)
    (i32.const 32)
   )
  )
 )
 (func $_ZN8TankDemo9move_tankERNS_4TankEll (param $0 i32) (param $1 i32) (param $2 i32)
  (drop
   (call $remove_i64
    (i64.or
     (i64.shl
      (i64.load32_u offset=24
       (get_local $0)
      )
      (i64.const 32)
     )
     (i64.load32_s offset=20
      (get_local $0)
     )
    )
    (i64.const -8942290522400096256)
    (i64.load
     (get_local $0)
    )
   )
  )
  (i32.store offset=24
   (get_local $0)
   (get_local $2)
  )
  (i32.store offset=20
   (get_local $0)
   (get_local $1)
  )
  (drop
   (call $store_i64
    (i64.or
     (i64.shl
      (i64.extend_u/i32
       (get_local $2)
      )
      (i64.const 32)
     )
     (i64.extend_s/i32
      (get_local $1)
     )
    )
    (i64.const -8942290522400096256)
    (get_local $0)
    (i32.const 32)
   )
  )
 )
 (func $_ZN8TankDemo16apply_spawn_tankERKNS_10CoordinateE (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $requireAuth
   (i64.load
    (get_local $0)
   )
  )
  (set_local $1
   (i64.load
    (get_local $0)
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store offset=32
   (get_local $8)
   (get_local $6)
  )
  (drop
   (call $load_i64
    (get_local $1)
    (i64.const -6891439815737212928)
    (i64.const 632468476610478080)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=40
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=41
     (get_local $8)
    )
   )
   (i32.const 32)
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $5)
          (i64.const 6)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$9)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store
   (get_local $8)
   (get_local $6)
  )
  (drop
   (call $load_i64
    (i64.or
     (i64.shl
      (i64.load32_u offset=12
       (get_local $0)
      )
      (i64.const 32)
     )
     (i64.load32_s
      (tee_local $3
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
     )
    )
    (i64.const -6891439815737212928)
    (i64.const -8942290522400096256)
    (get_local $8)
    (i32.const 32)
   )
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=8
     (get_local $8)
    )
   )
   (i32.const 32)
  )
  (i32.store offset=48
   (get_local $8)
   (i32.const 3)
  )
  (i32.store offset=44
   (get_local $8)
   (i32.const 3)
  )
  (i32.store offset=52
   (get_local $8)
   (tee_local $3
    (i32.load
     (get_local $3)
    )
   )
  )
  (i32.store offset=56
   (get_local $8)
   (tee_local $2
    (i32.load offset=12
     (get_local $0)
    )
   )
  )
  (drop
   (call $store_i64
    (i64.or
     (i64.shl
      (i64.extend_u/i32
       (get_local $2)
      )
      (i64.const 32)
     )
     (i64.extend_s/i32
      (get_local $3)
     )
    )
    (i64.const -8942290522400096256)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (drop
   (call $store_i64
    (i64.load
     (get_local $0)
    )
    (i64.const 632468476610478080)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 64)
   )
  )
 )
 (func $_ZN8TankDemo15apply_move_tankERKNS_10CoordinateE (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $11
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (call $requireAuth
   (i64.load
    (get_local $0)
   )
  )
  (set_local $1
   (i64.load
    (get_local $0)
   )
  )
  (set_local $8
   (i64.const 0)
  )
  (set_local $7
   (i64.const 59)
  )
  (set_local $6
   (i32.const 16)
  )
  (set_local $9
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $8)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $6)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$3)
       )
       (set_local $10
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $8)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $10
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $10
     (i64.shl
      (i64.and
       (get_local $10)
       (i64.const 31)
      )
      (i64.and
       (get_local $7)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $6
    (i32.add
     (get_local $6)
     (i32.const 1)
    )
   )
   (set_local $8
    (i64.add
     (get_local $8)
     (i64.const 1)
    )
   )
   (set_local $9
    (i64.or
     (get_local $10)
     (get_local $9)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $7
      (i64.add
       (get_local $7)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store offset=32
   (get_local $11)
   (get_local $9)
  )
  (drop
   (call $load_i64
    (get_local $1)
    (i64.const -6891439815737212928)
    (i64.const 632468476610478080)
    (i32.add
     (get_local $11)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=40
     (get_local $11)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=41
     (get_local $11)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load offset=48
     (get_local $11)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ge_s
    (i32.load offset=44
     (get_local $11)
    )
    (tee_local $3
     (i32.add
      (i32.xor
       (i32.add
        (tee_local $6
         (i32.sub
          (i32.load offset=56
           (get_local $11)
          )
          (i32.load offset=12
           (get_local $0)
          )
         )
        )
        (tee_local $6
         (i32.shr_s
          (get_local $6)
          (i32.const 31)
         )
        )
       )
       (get_local $6)
      )
      (i32.xor
       (i32.add
        (tee_local $6
         (i32.sub
          (i32.load offset=52
           (get_local $11)
          )
          (i32.load offset=8
           (get_local $0)
          )
         )
        )
        (tee_local $6
         (i32.shr_s
          (get_local $6)
          (i32.const 31)
         )
        )
       )
       (get_local $6)
      )
     )
    )
   )
   (i32.const 32)
  )
  (set_local $8
   (i64.const 0)
  )
  (set_local $7
   (i64.const 59)
  )
  (set_local $6
   (i32.const 16)
  )
  (set_local $9
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $8)
          (i64.const 6)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $6)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$9)
       )
       (set_local $10
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $8)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $10
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $10
     (i64.shl
      (i64.and
       (get_local $10)
       (i64.const 31)
      )
      (i64.and
       (get_local $7)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $6
    (i32.add
     (get_local $6)
     (i32.const 1)
    )
   )
   (set_local $8
    (i64.add
     (get_local $8)
     (i64.const 1)
    )
   )
   (set_local $9
    (i64.or
     (get_local $10)
     (get_local $9)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $7
      (i64.add
       (get_local $7)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store
   (get_local $11)
   (get_local $9)
  )
  (drop
   (call $load_i64
    (i64.or
     (i64.shl
      (i64.load32_u
       (tee_local $2
        (i32.add
         (get_local $0)
         (i32.const 12)
        )
       )
      )
      (i64.const 32)
     )
     (i64.load32_s
      (tee_local $6
       (i32.add
        (get_local $0)
        (i32.const 8)
       )
      )
     )
    )
    (i64.const -6891439815737212928)
    (i64.const -8942290522400096256)
    (get_local $11)
    (i32.const 32)
   )
  )
  (call $assert
   (i32.eqz
    (i32.load8_u offset=8
     (get_local $11)
    )
   )
   (i32.const 32)
  )
  (set_local $6
   (i32.load
    (get_local $6)
   )
  )
  (set_local $2
   (i32.load
    (get_local $2)
   )
  )
  (drop
   (call $remove_i64
    (i64.or
     (i64.shl
      (i64.load32_u
       (tee_local $4
        (i32.add
         (get_local $11)
         (i32.const 56)
        )
       )
      )
      (i64.const 32)
     )
     (i64.load32_s
      (tee_local $5
       (i32.add
        (get_local $11)
        (i32.const 52)
       )
      )
     )
    )
    (i64.const -8942290522400096256)
    (i64.load offset=32
     (get_local $11)
    )
   )
  )
  (i32.store
   (get_local $4)
   (get_local $2)
  )
  (i32.store
   (get_local $5)
   (get_local $6)
  )
  (drop
   (call $store_i64
    (i64.or
     (i64.shl
      (i64.extend_u/i32
       (get_local $2)
      )
      (i64.const 32)
     )
     (i64.extend_s/i32
      (get_local $6)
     )
    )
    (i64.const -8942290522400096256)
    (i32.add
     (get_local $11)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (i32.store
   (tee_local $6
    (i32.add
     (i32.add
      (get_local $11)
      (i32.const 32)
     )
     (i32.const 12)
    )
   )
   (i32.sub
    (i32.load
     (get_local $6)
    )
    (get_local $3)
   )
  )
  (drop
   (call $store_i64
    (i64.load
     (get_local $0)
    )
    (i64.const 632468476610478080)
    (i32.add
     (get_local $11)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $11)
    (i32.const 64)
   )
  )
 )
 (func $_ZN8TankDemo10apply_fireERKNS_8InteractE (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (set_local $5
   (i64.load offset=8
    (get_local $0)
   )
  )
  (call $requireNotice
   (i64.load
    (get_local $0)
   )
  )
  (call $requireNotice
   (get_local $5)
  )
  (call $requireAuth
   (i64.load
    (get_local $0)
   )
  )
  (set_local $1
   (i64.load
    (get_local $0)
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store offset=32
   (get_local $8)
   (get_local $6)
  )
  (drop
   (call $load_i64
    (get_local $1)
    (i64.const -6891439815737212928)
    (i64.const 632468476610478080)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (set_local $1
   (i64.load
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $5)
          (i64.const 6)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$9)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store
   (get_local $8)
   (get_local $6)
  )
  (drop
   (call $load_i64
    (get_local $1)
    (i64.const -6891439815737212928)
    (i64.const 632468476610478080)
    (get_local $8)
    (i32.const 32)
   )
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=40
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=41
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load offset=48
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=8
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=9
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load offset=16
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.le_s
    (select
     (tee_local $3
      (i32.add
       (i32.add
        (i32.xor
         (i32.add
          (tee_local $3
           (i32.sub
            (i32.load offset=52
             (get_local $8)
            )
            (i32.load offset=20
             (get_local $8)
            )
           )
          )
          (tee_local $3
           (i32.shr_s
            (get_local $3)
            (i32.const 31)
           )
          )
         )
         (get_local $3)
        )
        (i32.xor
         (i32.add
          (tee_local $3
           (i32.sub
            (i32.load offset=56
             (get_local $8)
            )
            (i32.load offset=24
             (get_local $8)
            )
           )
          )
          (tee_local $3
           (i32.shr_s
            (get_local $3)
            (i32.const 31)
           )
          )
         )
         (get_local $3)
        )
       )
       (i32.const -2)
      )
     )
     (i32.const 1)
     (i32.gt_s
      (get_local $3)
      (i32.const 1)
     )
    )
    (i32.load offset=44
     (get_local $8)
    )
   )
   (i32.const 32)
  )
  (i32.store offset=44
   (get_local $8)
   (i32.sub
    (i32.load offset=44
     (get_local $8)
    )
    (get_local $3)
   )
  )
  (i32.store offset=16
   (get_local $8)
   (i32.add
    (i32.load offset=16
     (get_local $8)
    )
    (i32.const -1)
   )
  )
  (drop
   (call $store_i64
    (i64.load
     (get_local $0)
    )
    (i64.const 632468476610478080)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (drop
   (call $store_i64
    (i64.load
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (i64.const 632468476610478080)
    (get_local $8)
    (i32.const 32)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 64)
   )
  )
 )
 (func $_ZN8TankDemo11apply_shareERKNS_8InteractE (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 64)
    )
   )
  )
  (set_local $5
   (i64.load offset=8
    (get_local $0)
   )
  )
  (call $requireNotice
   (i64.load
    (get_local $0)
   )
  )
  (call $requireNotice
   (get_local $5)
  )
  (call $requireAuth
   (i64.load
    (get_local $0)
   )
  )
  (set_local $1
   (i64.load
    (get_local $0)
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 6)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store offset=32
   (get_local $8)
   (get_local $6)
  )
  (drop
   (call $load_i64
    (get_local $1)
    (i64.const -6891439815737212928)
    (i64.const 632468476610478080)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (set_local $1
   (i64.load
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $5)
          (i64.const 6)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$9)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store
   (get_local $8)
   (get_local $6)
  )
  (drop
   (call $load_i64
    (get_local $1)
    (i64.const -6891439815737212928)
    (i64.const 632468476610478080)
    (get_local $8)
    (i32.const 32)
   )
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=40
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=41
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load offset=48
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=8
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load8_u offset=9
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load offset=16
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.ne
    (i32.load offset=44
     (get_local $8)
    )
    (i32.const 0)
   )
   (i32.const 32)
  )
  (call $assert
   (i32.lt_s
    (i32.add
     (i32.xor
      (i32.add
       (tee_local $3
        (i32.sub
         (i32.load offset=56
          (get_local $8)
         )
         (i32.load offset=24
          (get_local $8)
         )
        )
       )
       (tee_local $3
        (i32.shr_s
         (get_local $3)
         (i32.const 31)
        )
       )
      )
      (get_local $3)
     )
     (i32.xor
      (i32.add
       (tee_local $3
        (i32.sub
         (i32.load offset=52
          (get_local $8)
         )
         (i32.load offset=20
          (get_local $8)
         )
        )
       )
       (tee_local $3
        (i32.shr_s
         (get_local $3)
         (i32.const 31)
        )
       )
      )
      (get_local $3)
     )
    )
    (i32.const 4)
   )
   (i32.const 32)
  )
  (i32.store offset=44
   (get_local $8)
   (i32.add
    (i32.load offset=44
     (get_local $8)
    )
    (i32.const -1)
   )
  )
  (i32.store offset=12
   (get_local $8)
   (i32.add
    (i32.load offset=12
     (get_local $8)
    )
    (i32.const 1)
   )
  )
  (drop
   (call $store_i64
    (i64.load
     (get_local $0)
    )
    (i64.const 632468476610478080)
    (i32.add
     (get_local $8)
     (i32.const 32)
    )
    (i32.const 32)
   )
  )
  (drop
   (call $store_i64
    (i64.load
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
    (i64.const 632468476610478080)
    (get_local $8)
    (i32.const 32)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 64)
   )
  )
 )
 (func $init
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 48)
  )
  (set_local $4
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $3)
          (i64.const 3)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 160)
         )
        )
        (br $label$3)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $4
    (i64.or
     (get_local $5)
     (get_local $4)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (set_local $3
   (i64.const 0)
  )
  (set_local $2
   (i64.const 59)
  )
  (set_local $1
   (i32.const 16)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$6
   (block $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (br_if $label$11
         (i64.gt_u
          (get_local $3)
          (i64.const 6)
         )
        )
        (br_if $label$10
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $0
             (i32.load8_s
              (get_local $1)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $0
         (i32.add
          (get_local $0)
          (i32.const 160)
         )
        )
        (br $label$9)
       )
       (set_local $5
        (i64.const 0)
       )
       (br_if $label$8
        (i64.le_u
         (get_local $3)
         (i64.const 11)
        )
       )
       (br $label$7)
      )
      (set_local $0
       (select
        (i32.add
         (get_local $0)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $0)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $5
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $0)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $5
     (i64.shl
      (i64.and
       (get_local $5)
       (i64.const 31)
      )
      (i64.and
       (get_local $2)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (i64.add
     (get_local $3)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $5)
     (get_local $6)
    )
   )
   (br_if $label$6
    (i64.ne
     (tee_local $2
      (i64.add
       (get_local $2)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i32.store8 offset=8
   (get_local $7)
   (i32.const 1)
  )
  (i64.store
   (get_local $7)
   (get_local $6)
  )
  (i64.store offset=12 align=4
   (get_local $7)
   (i64.const 12884901891)
  )
  (i64.store offset=20 align=4
   (get_local $7)
   (i64.const 0)
  )
  (drop
   (call $store_i64
    (get_local $4)
    (i64.const 632468476610478080)
    (get_local $7)
    (i32.const 32)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 32)
   )
  )
 )
 (func $apply (param $0 i64) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $8
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $5
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 48)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (br_if $label$5
         (i64.gt_u
          (get_local $5)
          (i64.const 3)
         )
        )
        (br_if $label$4
         (i32.gt_u
          (i32.and
           (i32.add
            (tee_local $2
             (i32.load8_s
              (get_local $3)
             )
            )
            (i32.const -97)
           )
           (i32.const 255)
          )
          (i32.const 25)
         )
        )
        (set_local $2
         (i32.add
          (get_local $2)
          (i32.const 160)
         )
        )
        (br $label$3)
       )
       (set_local $7
        (i64.const 0)
       )
       (br_if $label$2
        (i64.le_u
         (get_local $5)
         (i64.const 11)
        )
       )
       (br $label$1)
      )
      (set_local $2
       (select
        (i32.add
         (get_local $2)
         (i32.const 234)
        )
        (i32.const 0)
        (i32.lt_u
         (i32.and
          (i32.add
           (get_local $2)
           (i32.const -49)
          )
          (i32.const 255)
         )
         (i32.const 5)
        )
       )
      )
     )
     (set_local $7
      (i64.shr_s
       (i64.shl
        (i64.extend_u/i32
         (get_local $2)
        )
        (i64.const 56)
       )
       (i64.const 56)
      )
     )
    )
    (set_local $7
     (i64.shl
      (i64.and
       (get_local $7)
       (i64.const 31)
      )
      (i64.and
       (get_local $4)
       (i64.const 4294967295)
      )
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $7)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (block $label$6
   (br_if $label$6
    (i64.ne
     (get_local $6)
     (get_local $0)
    )
   )
   (set_local $5
    (i64.const 0)
   )
   (set_local $4
    (i64.const 59)
   )
   (set_local $3
    (i32.const 64)
   )
   (set_local $6
    (i64.const 0)
   )
   (loop $label$7
    (block $label$8
     (block $label$9
      (block $label$10
       (block $label$11
        (block $label$12
         (br_if $label$12
          (i64.gt_u
           (get_local $5)
           (i64.const 4)
          )
         )
         (br_if $label$11
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $2
              (i32.load8_s
               (get_local $3)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $2
          (i32.add
           (get_local $2)
           (i32.const 160)
          )
         )
         (br $label$10)
        )
        (set_local $7
         (i64.const 0)
        )
        (br_if $label$9
         (i64.le_u
          (get_local $5)
          (i64.const 11)
         )
        )
        (br $label$8)
       )
       (set_local $2
        (select
         (i32.add
          (get_local $2)
          (i32.const 234)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $2)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $7
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $2)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $7
      (i64.shl
       (i64.and
        (get_local $7)
        (i64.const 31)
       )
       (i64.and
        (get_local $4)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $3
     (i32.add
      (get_local $3)
      (i32.const 1)
     )
    )
    (set_local $5
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
    )
    (set_local $6
     (i64.or
      (get_local $7)
      (get_local $6)
     )
    )
    (br_if $label$7
     (i64.ne
      (tee_local $4
       (i64.add
        (get_local $4)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (block $label$13
    (br_if $label$13
     (i64.ne
      (get_local $6)
      (get_local $1)
     )
    )
    (call $assert
     (i32.gt_u
      (call $readMessage
       (get_local $8)
       (i32.const 16)
      )
      (i32.const 15)
     )
     (i32.const 80)
    )
    (call $_ZN8TankDemo16apply_spawn_tankERKNS_10CoordinateE
     (get_local $8)
    )
    (br $label$6)
   )
   (set_local $5
    (i64.const 0)
   )
   (set_local $4
    (i64.const 59)
   )
   (set_local $3
    (i32.const 112)
   )
   (set_local $6
    (i64.const 0)
   )
   (loop $label$14
    (block $label$15
     (block $label$16
      (block $label$17
       (block $label$18
        (block $label$19
         (br_if $label$19
          (i64.gt_u
           (get_local $5)
           (i64.const 3)
          )
         )
         (br_if $label$18
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $2
              (i32.load8_s
               (get_local $3)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $2
          (i32.add
           (get_local $2)
           (i32.const 160)
          )
         )
         (br $label$17)
        )
        (set_local $7
         (i64.const 0)
        )
        (br_if $label$16
         (i64.le_u
          (get_local $5)
          (i64.const 11)
         )
        )
        (br $label$15)
       )
       (set_local $2
        (select
         (i32.add
          (get_local $2)
          (i32.const 234)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $2)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $7
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $2)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $7
      (i64.shl
       (i64.and
        (get_local $7)
        (i64.const 31)
       )
       (i64.and
        (get_local $4)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $3
     (i32.add
      (get_local $3)
      (i32.const 1)
     )
    )
    (set_local $5
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
    )
    (set_local $6
     (i64.or
      (get_local $7)
      (get_local $6)
     )
    )
    (br_if $label$14
     (i64.ne
      (tee_local $4
       (i64.add
        (get_local $4)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (block $label$20
    (br_if $label$20
     (i64.ne
      (get_local $6)
      (get_local $1)
     )
    )
    (call $assert
     (i32.gt_u
      (call $readMessage
       (get_local $8)
       (i32.const 16)
      )
      (i32.const 15)
     )
     (i32.const 80)
    )
    (call $_ZN8TankDemo15apply_move_tankERKNS_10CoordinateE
     (get_local $8)
    )
    (br $label$6)
   )
   (set_local $5
    (i64.const 0)
   )
   (set_local $4
    (i64.const 59)
   )
   (set_local $3
    (i32.const 128)
   )
   (set_local $6
    (i64.const 0)
   )
   (loop $label$21
    (block $label$22
     (block $label$23
      (block $label$24
       (block $label$25
        (block $label$26
         (br_if $label$26
          (i64.gt_u
           (get_local $5)
           (i64.const 3)
          )
         )
         (br_if $label$25
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $2
              (i32.load8_s
               (get_local $3)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $2
          (i32.add
           (get_local $2)
           (i32.const 160)
          )
         )
         (br $label$24)
        )
        (set_local $7
         (i64.const 0)
        )
        (br_if $label$23
         (i64.le_u
          (get_local $5)
          (i64.const 11)
         )
        )
        (br $label$22)
       )
       (set_local $2
        (select
         (i32.add
          (get_local $2)
          (i32.const 234)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $2)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $7
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $2)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $7
      (i64.shl
       (i64.and
        (get_local $7)
        (i64.const 31)
       )
       (i64.and
        (get_local $4)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $3
     (i32.add
      (get_local $3)
      (i32.const 1)
     )
    )
    (set_local $5
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
    )
    (set_local $6
     (i64.or
      (get_local $7)
      (get_local $6)
     )
    )
    (br_if $label$21
     (i64.ne
      (tee_local $4
       (i64.add
        (get_local $4)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (block $label$27
    (br_if $label$27
     (i64.ne
      (get_local $6)
      (get_local $1)
     )
    )
    (call $assert
     (i32.gt_u
      (call $readMessage
       (get_local $8)
       (i32.const 16)
      )
      (i32.const 15)
     )
     (i32.const 80)
    )
    (call $_ZN8TankDemo10apply_fireERKNS_8InteractE
     (get_local $8)
    )
    (br $label$6)
   )
   (set_local $5
    (i64.const 0)
   )
   (set_local $4
    (i64.const 59)
   )
   (set_local $3
    (i32.const 144)
   )
   (set_local $6
    (i64.const 0)
   )
   (loop $label$28
    (block $label$29
     (block $label$30
      (block $label$31
       (block $label$32
        (block $label$33
         (br_if $label$33
          (i64.gt_u
           (get_local $5)
           (i64.const 4)
          )
         )
         (br_if $label$32
          (i32.gt_u
           (i32.and
            (i32.add
             (tee_local $2
              (i32.load8_s
               (get_local $3)
              )
             )
             (i32.const -97)
            )
            (i32.const 255)
           )
           (i32.const 25)
          )
         )
         (set_local $2
          (i32.add
           (get_local $2)
           (i32.const 160)
          )
         )
         (br $label$31)
        )
        (set_local $7
         (i64.const 0)
        )
        (br_if $label$30
         (i64.le_u
          (get_local $5)
          (i64.const 11)
         )
        )
        (br $label$29)
       )
       (set_local $2
        (select
         (i32.add
          (get_local $2)
          (i32.const 234)
         )
         (i32.const 0)
         (i32.lt_u
          (i32.and
           (i32.add
            (get_local $2)
            (i32.const -49)
           )
           (i32.const 255)
          )
          (i32.const 5)
         )
        )
       )
      )
      (set_local $7
       (i64.shr_s
        (i64.shl
         (i64.extend_u/i32
          (get_local $2)
         )
         (i64.const 56)
        )
        (i64.const 56)
       )
      )
     )
     (set_local $7
      (i64.shl
       (i64.and
        (get_local $7)
        (i64.const 31)
       )
       (i64.and
        (get_local $4)
        (i64.const 4294967295)
       )
      )
     )
    )
    (set_local $3
     (i32.add
      (get_local $3)
      (i32.const 1)
     )
    )
    (set_local $5
     (i64.add
      (get_local $5)
      (i64.const 1)
     )
    )
    (set_local $6
     (i64.or
      (get_local $7)
      (get_local $6)
     )
    )
    (br_if $label$28
     (i64.ne
      (tee_local $4
       (i64.add
        (get_local $4)
        (i64.const -5)
       )
      )
      (i64.const -6)
     )
    )
   )
   (br_if $label$6
    (i64.ne
     (get_local $6)
     (get_local $1)
    )
   )
   (call $assert
    (i32.gt_u
     (call $readMessage
      (get_local $8)
      (i32.const 16)
     )
     (i32.const 15)
    )
    (i32.const 80)
   )
   (call $_ZN8TankDemo11apply_shareERKNS_8InteractE
    (get_local $8)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $8)
    (i32.const 16)
   )
  )
 )
)
