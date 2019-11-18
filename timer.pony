use "time"

actor Main
    """
    Timer program. 
    Sleep for 5 seconds, and repeat to run Notify.apply method by 2 seconds.
    """
    new create(env: Env) =>
        let timers = Timers
        let timer = Timer(Notify(env), 5_000_000_000, 2_000_000_000)
        timers(consume timer)

class Notify is TimerNotify
  let _env: Env
  var _counter: U32 = 0

  new iso create(env: Env) =>
    _env = env

  fun ref apply(timer: Timer, count: U64): Bool =>
    _env.out.print(_counter.string())
    _counter = _counter + 1
    true
