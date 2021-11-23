(
~port = 12000;
~port =  3333;
b= NetAddr.new("localhost",~port);
)


Taken from Classes | Collections > Unordered | Streams-Patterns-Events > Events doc file

(
Event.addEventType(\dosisEvent, { |server|
	// [~amp, ~degree, ~instrument].postln;
	b.sendMsg(~instrument,"instrument",~instrument,"degree",~degree,"amp",~amp,);
    ~type = \note; // now set type to a different one
    currentEnvironment.play;
});
)

Hello, from la soledá: la felicidá

(
s.waitForBoot{
    SynthDef(\hh, {|amp= 1, rel= 0.05|
        var e= EnvGen.ar(Env.perc(0, rel, amp, -10), doneAction:2);
        var z= WhiteNoise.ar(e);
        z= BPF.ar(z, 5000, 0.4);
        Out.ar(0, Pan2.ar(z, 0, 1.5));
    }).add;
    SynthDef(\bz, {|amp= 1, rel= 0.25, freq= 400|
        var e= EnvGen.ar(Env.perc(0.01, rel, amp), doneAction:2);
        var z= BPF.ar(Blip.ar(e+1*(freq*0.1), 3), freq*2, 0.1, amp*10*e);
        Out.ar(0, Pan2.ar(z, 0));
    }).add;
    SynthDef(\bd, {|amp= 1, rel= 0.1|
        var e= EnvGen.ar(Env.perc(0, rel, amp, -10), doneAction:2);
        var z= Mix(SinOsc.ar(#[150, 160, 170], 0, e*0.4));
        Out.ar(0, Pan2.ar(z, 0));
    }).add;
};
)
c= TempoClock(114/60);
c.tempo = 60/60;

Pdef(\bd).play(c, quant:4)
Pdef(\bz).play(c, quant:4)
Pdef(\hh).play(c, quant:4)
Pdef(\bd, Pbind(\type, \dosisEvent, \instrument, \bd, \amp, 1))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \amp, Pbjorklund(3, 8, inf), \degree, Pseq(#[0, 4], inf), \dur, 0.5))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \amp, Pbjorklund(4, 8, inf), \degree, Pseq(#[0, 4], inf), \dur, 0.5))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \amp, Pbjorklund(5, 8, inf), \degree, Pseq(#[0, 4], inf), \dur, 0.5))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \amp, Pbjorklund(6, 8, inf), \degree, Pseq(#[0, 4], inf), \dur, 0.5))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \amp, Pbjorklund(7, 8, inf), \degree, Pseq(#[0, 4], inf), \dur, 0.5))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \amp, Pbjorklund(8, 8, inf), \degree, Pseq(#[0, 4], inf), \dur, 0.5))
Pdef(\hh, Pbind(\type, \dosisEvent, \instrument, \hh, \dur, 0.25, \amp, Pbjorklund(3, 8, inf)))
Pdef(\hh, Pbind(\type, \dosisEvent, \instrument, \hh, \dur, 0.25, \amp, Pbjorklund(5, 8, inf)))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \dur, 0.25, \amp, Pbjorklund(3, 8, inf), \degree, Pseq(#[0, 4, 1], inf)))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \dur, 0.25, \amp, Pbjorklund(5, 16, inf), \degree, Pseq(#[0, 4, 1], inf)))
Pdef(\hh, Pbind(\type, \dosisEvent, \instrument, \hh, \dur, 0.25, \amp, Pbjorklund(9, 16, inf)))
Pdef(\hh, Pbind(\type, \dosisEvent, \instrument, \hh, \dur, 0.25, \amp, Pbjorklund(17, 32, inf)))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \dur, 0.25, \amp, Pbjorklund(11, 32, inf), \degree, Pseq(#[0, 4, 1], inf)))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \dur, 0.25, \amp, Pbjorklund(5, 32, inf), \degree, Pseq(#[0, 1, 2, 3, 4, 5, 6, 7], inf)))
Pdef(\hh, Pbind(\type, \dosisEvent, \instrument, \hh, \dur, 0.25, \amp, Pbjorklund(8, 32, inf)))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \dur, 0.25, \amp, Pbjorklund(15, 32, inf), \degree, Pseq(#[0, 1, 2, 3, 4, 5, 6, 7], inf)))
Pdef(\bz, Pbind(\type, \dosisEvent, \instrument, \bz, \dur, 0.125, \amp, Pbjorklund(Pseq([8, 6, 8, 5, 8, 3, 8, 1], inf), 32, inf), \degree, Pseq(#[0, 1, 2, 3, 4, 5, 6, 7], inf)))
Pdef(\bd).stop
Pdef(\hh).stop
Pdef(\bz).stop

b.disconnect;


b.free