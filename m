From: "Thomas Raschbacher" <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS
Date: Sun, 11 Dec 2005 07:21:10 -0000 (GMT)
Message-ID: <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>
References: <1129303303.3370.4.camel@desktop> 
    <200510142008.42253.vitaly@namesys.com> 
    <1129484435.16949.1.camel@desktop> 
    <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com> 
    <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>
    <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>
Reply-To: lordvan@lordvan.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-27259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com

Hi,

Finally got my new HDD (300 GB UDMA133 :D no usb anymore ..)
i backed up my data and ran reiserfsck on one of the other partitions
which were supposedly damaged.
it didn't work out (stopped at same point always)

then i made a backup copy of my backup copy and ran reiserfsck on that and
it worked just fine.

-> it seems that my filesystems never had errors in the first place but
running reiserfsck on my USB hdd caused the problems in the first place.
fortunately i could recover all my digital camera photos (which i will
definitely back up on DVD from now on!
some mp3's lost the filenames but who really cares about that anyway.

i suggest adding to the reiserfsck docs that running it on usb-hdds might
cause problems due to usb hdd driver bugs or whatever .. or at least a
note that if it fails on usb-hdd copy it to a non usb hdd and try again.

Regards,
  Thomas R
P.S.: I never enforced bandwidth allocation. but i still dont' know what
the problem is with this stupid USB2 storage stuffs .. it worked fine with
some old kernel (either early 2.6 or still 2.4 ..) any ideas what can
cause this kind of problems with usb hdds? or should i post to some kernel
mailing list/newsgroup?


-- 
-----BEGIN GEEK CODE BLOCK-----
GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K w-- O
M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e-->+++++ h-- !r
z-
------END GEEK CODE BLOCK------

On Thu, October 20, 2005 19:55, michael chang said:
> On 10/19/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
>> Actually I did send it SIGUSR1 signals to get the progress so it really
>> seems to work fine.
>> I intend to get another HDD (internal) and see if i can copy the FS and
>> then fix it there.
>> how would I best copy the filesystem? DD ?
>> (The PRoblems I had before with this disc are USB-storage related where
>> the disc does stop working if one reads/writes too much data at once on
>> USB2)
>
> The USB2 data loss thing sounds like a bandwidth-allocation problem;
> since it's not always advisible to enforce it by default (well, I
> don't know about that, but I don't enforce it in any of my hand-built
> kernels).  What you are doing next sounds reasonable, please inform us
> how well it goes.
>
> --
> ~Mike
>  - Just my two cents
>  - No man is an island, and no man is unable.
>


