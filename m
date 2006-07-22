From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 status (correction)
Date: Sat, 22 Jul 2006 15:37:04 -0500
Message-ID: <44C28C70.3010407@slaphack.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com>	 <1153514509.6659.41.camel@ipso.snappymail.ca>	 <44C141C4.1030802@slaphack.com>	 <1153517853.6659.56.camel@ipso.snappymail.ca>	 <44C157D2.5060202@slaphack.com>	 <1153525982.6659.108.camel@ipso.snappymail.ca>	 <44C191FD.4010302@slaphack.com>  <44C1BD65.8070204@namesys.com>	 <1153558557.6659.152.camel@ipso.snappymail.ca>	 <44C21B3A.9050000@slaphack.com> <1153598173.6659.219.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153598173.6659.219.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Mike Benoit wrote:

> code. Even just compressing that small portion though I could probably
> save between 5-10GB. The difference is though I can do a df before, and
> a df after, and I can instantly see I got my moneys worth. Same with
> encryption. 

In the case of encryption, it's also got competition.  There are two 
FUSE filesystems that do crypto, and there's cryptoloop/dm-crypt, which 
you need anyway for encrypted swap.

True, it's nowhere near as nice, but it is functional.  You would think 
one of these would be easier to develop to where it's useful.  And if 
you're encrypting it, you're already accepting a performance hit.

So again, the Reiser4 advantage here is all speed.

> http://parallel.vub.ac.be/~johan/compFUSEd/index.php?option=polls&task=results&pollid=31

Of course they are, or they wouldn't use FUSE.

But if that's really true, why wouldn't a FUSE driver help you?

> Most of those FUSE file systems you linked to scare me. This is from the
> APFS web page:

> I have lost all my data! How do I get it back?
> From the backup, obviously."

To be fair, that's what you get from any FS.

But how hard would it be to make a FUSE filesystem work properly?  How 
hard would it be to get a Reiser4 plugin to work properly?

> FUSE is great, but can it even come close to matching the performance of
> in-kernel file systems?

Performance again!

> Not only that, but if you want to compress a
> directory you have to go through about a 12 step process of moving the
> files, setting up a mount point, and moving the files back. 

You listed 3 steps.  Besides, I don't see anything stopping you from 
modifying one of these to selectively compress things, the way Reiser4 
would.  So, put your entire FS under a FUSE system, then configure which 
directories you want compressed.

Again, the drawback is huge gobs of performance.  It just seems natural 
to use the repacker if you're going to use any Reiser4-based replacement 
for these.

> You could, and we did charge by the megabyte, only after they exceeded
> the limit of their package. However web hosting is a fiercely
> competitive market, so we were constantly adjusting our packages to
> include more disk space, more bandwidth, more features for the same
> amount, or lower prices, just to compete. The way many "shared hosting"
> companies work is each server is waaay over sold, at least in the disk

Ah, so I guess the advantage of a more expensive, dedicated box is that 
you know no one's overselling it?

Personally, I get a little sick of the insane amounts of overselling 
that happen -- you just know it's going to come back and bite you in the 
ass.  This is happening right now with bandwidth, and overselling is 
pretty much solely responsible for the whole Net Neutrality mess -- it 
would be a complete non-issue if "5 megabits to your house!!!!!" was 
backed up by an actual 5 megabits reserved for me, or if they sold them 
as "2-5 megabits", where 2 is guaranteed, and 5 is what you get when no 
one else is using it.

I'm a bit skeptical of my local ISP's Fiber To The Home initiative, 
because I can't imagine they have enough spare upstream bandwidth just 
lying around.

I mean, if you actually have enough bandwidth, you don't want or need 
your ISP to do QoS or prioritizing for you -- you can just do it 
yourself.  Personally, ssh packets would be of a much higher priority to 
me than anything else...

> Thats pretty much the only way you make money with $10-20/month
> packages.

Yeah, I know, hard for an honest guy to compete...

> I don't doubt the benefits of the repacker, but from a business
> perspective the repacker is something that runs transparently in the
> background, once you install it, things magically speed up then you
> never hear from it again as it does its job. Out of sight, out of mind.
> Whereas the compression/encryption plugin are always in your face, every
> time you run df, or enter a passphrase to gain access to your files, you
> know its there and working. Its something you'll tell your friends
> about. After you first run it, the repacker just fades away in to the
> background and you forget about it.

Ah.  This might explain the success of things like Ruby On Rails.  Once 
it's done, the insane amount of CPU required to run a high-level 
interpreted language (versus even something semi-interpreted like perl) 
is out of sight, out of mind.  But when you first set it up, the savings 
in development time are immediately obvious, in your face.

Although I would want to find a way to avoid typing a passphrase every 
time -- maybe keep the key on a USB keychain.  Passphrases would just 
annoy users.  Unless, of course, you could tie it to logon -- assuming 
you can actually change the passphrase later...

> Charging only for commercial use of the repacker/compression/encryption
> plugin would be a great middle ground. 

Good, I'm glad it wasn't a completely insane idea.
