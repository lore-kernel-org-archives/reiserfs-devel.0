From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: 23 Feb 2003 18:10:56 -0500
Message-ID: <b3bke0$4rt$1@satsuki.furryterror.org>
References: <200302141316.41198.sam@vilain.net>
Return-path: <reiserfs-list-return-12882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <200302141316.41198.sam@vilain.net>,
Sam Vilain  <sam@vilain.net> wrote:
>> SMART does give you statistics on ECC recovery rates, temperature,
>> number of remapped sectors, etc. which can give you a hint, if you keep
>> track of them over time, when your disk is beginning to have more
>> problems than it did have when it was newer.  Maybe about 50% of
>> failures can be predicted this way (but you have no idea _when_ the
>> failure will occur--this afternoon or next summer?) it's little better
>> than the MTBF rating.  The other 50% of failures are predicted only
>> after the fact.  :-P
>
>Presumably 50% is a guess rather than a carefully measured statistic.  

The precise figure I have is 12
showed_signs_of_problems_through_smart_first / 23 total_failed_disks,
or 52%.  That counts only disks that I was able to observe with SMART data
prior to failure and that have since failed, so it really only counts
disks from the last 2-3 years.  50% was just a guess when I quoted it,
but it was a good guess.  ;-)

Prior to SMART, I used to just listen to disks and measure their
read throughput across the disk.  If there was any change in the sound
signature, or new non-linearities in the read speed of various areas of
the disk, the disk would fail in the near future roughly half of the time.

One major problem with using SMART data for failure prediction is that
the failure prediction data is all vendor-specific, so its meaning is
not always well-defined, and it is all optional.  The "standard" SMART
failure data only reports fatal failure of the disk, and only after it
has failed (e.g. the electrical system fails the power-on self-test, or
a long self-test found a medium error).  Some disks report ECC rates,
some report reallocated sectors, some have error logs...others don't.
Some claim to have these features but bugs in the firmware or limited (I
would say "braindead") implementation prevent them from actually working.

>My
>inclination would be towards thinking that 90% or more of failures that do
>not happen around the time of a power state change would be noticable by
>the ECC corrections first.  

I have not observed any correlation between ECC correction rates
and drive failure.  Most of the drives that I have observed either didn't
report ECC rates at all, did not have significant ECC rates
(a few dozen/hour if not zero), or did not have a significant change
in ECC rates before failure.  Also, no drive in my collection with ECC
reporting capability has survived with the ability to report ECC rates
after failure, so I can't even try to read a known bad sector to see if
the ECC count actually goes up.

I have drives that have been running with
millions-of-ECC-detected-per-minute for the past two years.  They're
_very_ slow--peak sequential I/O rate of 5MBytes/sec when seeking,
where an identical model drive under identical conditions would normally
give 20-40MBytes/sec.  They haven't lost any data yet, and they've never
reported an I/O error, and the vendor won't take them back until one of
those two events happens, so I'm stuck with them.  :-P

I've found that the "remapped sector count" is a good indicator of
future fatal disk failure, in that most disks will fatally fail soon
after detecting new remapped sectors; however, "soon" has a range of
a few minutes to a year or more, and the no-remapped-sectors condition
does not mean that the drive will not fail in the near future.

>The failures that happen around the time of
>power state change (including power spikes) would make your statistic more
>or less correct.

I have observed exactly two disk failures in the field around a power
state change, one in 1989 and one in 1991.  In both cases the parts
of the drive electronics that are active during initial spin-up had
failed (with a big burned spot on the circuit board).

Since Energy Star, drive vendors have been designing disks to survive
thousands of spin-up/spin-down cycles, and that particular failure mode
has mostly gone away.  I've observed thousands of power state changes
(including a dozen power supply failures, such as power supplies that
put 48VAC across the nominal 12VDC hard disk power supply) and hundreds
of disk failures.  They don't tend to happen at near the same
time--certainly not anything near 50%.

Of course I can get more interesting failure modes if I start poking
around the drive electronics or components directly, or if I modify
the firmware.  What's statistically likely and what's possible are
different things.

>> The position data was
>> initially written using frighteningly expensive precision hardware at
>> the disk drive factory and cannot be regenerated without said equipment>.
>
>Interesting; does this happen before the platter is inserted into the
> disk? 

The head position data is usually on one platter surface, and it consumes
all of that surface.  All of the disk heads are attached to the same arm
assembly, so they only need one surface--tracks are defined on other
platters in terms of wherever the head happens to be when the head with
the control data is in the correct position.  The data must be available
at all times during a seek, so it can't coexist with user data easily.

Tricks used by other devices to solve this problem don't work on hard
disks.  CD-ROMs encode position data in a subchannel of the data stream,
which works as long as you don't have to write the data in a device that
costs less than a luxury car.  CD-Rs have a separate position data track
elsewhere in the disk, and drives with dual-focus lenses that can see
the user data area and the position data at the same time--all of which
only works for optical systems.  DVDs use the multi-layer technique to
store half of their data capacity, which causes problems for DVD writers.
Floppy disks have position control inside the drive instead of on the
media, but they must tolerate position errors in the hundreds of microns.

> I have heard that vendors each have specific low level format
> utilities, which perform the job of remapping failed sectors and I would
> have thought, writing this timing information.  Chickens and Eggs spring
> to mind, though.

It is possible for the drive to write position data within a single track;
indeed, it has to, since the positions of the tracks on the platters
cannot be determined until the drive is mostly assembled.  This data
specifies sector boundaries and such, and of course all the actual user
data.  If the bits of data that indicate "sector 4 begins here" were lost,
a low-level format could get them back, but so could a full track write.

A hard disk by itself couldn't write the seek data accurately enough
even if it had the sensors required--the environment inside a PC has
too much vibration and thermal variation, and the error tolerances for
user data are higher than for the head position data.  About the best
you could expect would be the capacity of a Jaz or Zip disk.

Now you'd *think* that all drive vendors would try to prevent writes to
that special platter in hardware, e.g. by not providing a write current
level amplifier for that platter, or even a current limiter to prevent
power surges from other parts of the electronics.  You really would.

>> The M in MTBF is Mean, not Maximum or Minimum.  [...]
>It actually stands for Meaningless, I'm sure :-)  Vendors should be 
>required to state this figure in terms of the number of unit failures the>y
>experienced running X units for T amount of time.

Usually they also specify things like duty cycle, which make the MTBF
even more meaningless.  I could claim a 5-year MTBF at 20% duty cycle
for a drive that dies within two hours of 100% duty cycle ("oh, yes, but
I only _specified_ the MTBF at 20% duty...").  If I didn't know better,
I'd swear some vendors actually do this.  :-P

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
