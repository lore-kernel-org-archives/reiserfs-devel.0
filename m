From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: trolling
Date: 13 Feb 2003 14:54:50 -0500
Message-ID: <b2gt6a$8dq$1@satsuki.furryterror.org>
References: <3E494808.413781E@interface-ag.com> <3E494808.413781E@interface-ag.com> <20030212131120.A10438@t-raenon.nmd.msu.ru>
Return-path: <reiserfs-list-return-12745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20030212131120.A10438@t-raenon.nmd.msu.ru>,
Alexander Lyamin  <flx@msu.ru> wrote:
>P.S. "In addition, check your facts before making a statement
>that insults someone and claims something that is completely untrue."
>
>Powersupply units physically damaging hard-drive disks (plates!).

I wouldn't characterize that as "untrue," more like "technically
incomplete."  There are lots of ways to permanently disable hard disks
without physically damaging them.

Disk head servo controllers operate using some of the data on the disk
platter as a position encoder, which is used in a feedback scheme
to control the motor.  The motor's electrical power is literally a
function of the previous position, the theoretical position, and the
current position as reported by reading data through the disk head.
Assuming that the normal operating rules for the DC servo controller and
write head power are violated (e.g. because the CPU on the disk controller
board is going insane due to invalid power supply feed corrupting its
memory, or due to an external physical shock during a write), it is
possible to corrupt the position data on the platter and permanently lose
the ability to seek to some areas of the platter.  The position data was
initially written using frighteningly expensive precision hardware at
the disk drive factory and cannot be regenerated without said equipment.

Speaking of DC server controller operating rule violations...those motors
are fairly powerful, and they normally operate at only a few percent of
their full power most of the time.  Very short pulses of significant power
are used during acceleration and deceleration.  Full power sustained for
any significant interval of time on the head motor may damage the heads
as they collide with the side of the drive case, or bend the arm the
heads are mounted on.  On the other hand, when the motors are moving,
the drive must feed their kinetic energy back into the power supply to
make them stop.  A bad power supply can result in position overshoots,
although most disks will correct for these automatically (they'll probably
be a lot slower though).

Consider what happens if the circuit which accelerates the disk from a
standing stop (a fairly high-power circuit, actually the highest power
circuit in the disk drive) does not turn off automatically when the disk
reached its cruising velocity, and instead simply keeps accelerating the
disk as fast as air resistance and maximum power output would allow.
Either the platters will fly apart, or the electronics will cook in
their own heat.

It's also possible to rewrite the disk controller firmware on the disk.
Usually only a minimal loader program is provided in ROM, and the rest
of the drive's firmware is stored on the disk itself--two copies on
two different tracks, near the track 0 index mark where they can be
located with a very simple motor controller program.  This trades cheap
disk space and fast RAM for expensive and slow flash ROM.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
