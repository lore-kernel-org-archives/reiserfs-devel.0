From: Sander <sander@humilis.net>
Subject: Re: 2.4.21 -> 2.4.25 cryptoloop mess
Date: Sat, 8 Jan 2005 15:43:09 +0100
Message-ID: <20050108144309.GA27949@favonius>
References: <30550.1102921988@www5.gmx.net> <16382.1105193211@www43.gmx.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <16382.1105193211@www43.gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Danny Norging <norging@gmx.de>
Cc: reiserfs-list@namesys.com

Danny Norging wrote (ao):
> since Vitaly seems not to take notice of my mail and I cant afford
> another money-order (being just a student), I wonder if somebody else
> out there has *any* hint on what to try next. Please have a look at
> this

First of all I would like to tell you and others (on the list or reading
the archive/google) that you should always make a raw copy of the image
you want to fsck. Do this with dd for example. Then perform all the
actions on the copy so you can have a fresh try again later with
different (or newer) tools and options.

From your mail it seems you only made a copy after you already fsck'ed
(pun intended) the original image. Now this is your second mistake. The
first one: you didn't have (or seem to have had) backups.


> Date: Mon, 13 Dec 2004 08:13:08 +0100 (MET)
> From: "Danny Norging" <norging@gmx.de>
> 
> needed to buy a bigger hd so this took some time, but now i am done
> with your instructions (*thanks a lot for them, i have hope*). Still a
> lot of work to do, i guess... so this is what i have done:
> 
> # losetup -e aes /dev/loop0 /dev/hdc1
> # dd if=/dev/loop0 of=hdc1decrypted.dump
> # losetup /dev/loop1 hdc1decrypted.dump
> # reiserfsck --rebuild-tree -S /dev/loop1 -l reiserfsck.log
> 
> where reiserfsck.log shows the following:
> # cat reiserfsck.log 
> ####### Pass 0 #######
> 28 directory entries were hashed with "r5" hash.
> ####### Pass 1 #######
> ####### Pass 2 #######
> ####### Pass 3 #########
> vpf-10680: The directory [2 3] has the wrong block count in the StatData (2)
> - corrected to (1)
> vpf-10650: The directory [2 3] has the wrong size in the StatData (720) -
> corrected to (48)
> ####### Pass 3a (lost+found pass) #########
> #

Did you mount the fs afterwards? Did you find any new content? What
reiserfscs version did you use?


> > > From: "Danny Norging" <norging@gmx.de>
> > > To: support@namesys.com

> > > All worked without any problems until a power failure somehow
> > > corrupted the fs :-( Unfortunately, I did a complete system update
> > > to a 2.4.25 kernel trying to repair the reiserfs from this new
> > > system, and as there seems to be a incompatibilty between the
> > > cryptoloop versions, this is where all really got mixed up :-( I
> > > cant remember all the steps i took using reiserfsck (at least once
> > > with the --rebuild-tree option) with the 2.4.25 kernel and later
> > > with a downgraded 2.4.21 kernel maybe on a wrongly decrypted fs...
> > 
> > if you run reiserfsck --rebuild-tree on the device with the wrong
> > decryption 
> > you probably erase all the data on it. 

Isn't it more likely that reiserfsck in that case doesn't recognize the
filesystem at all and just exits with an error? (I'm just a user
though).


> > > End of the story is that i am now able to losetup/decrypt the
> > > partition correctly (using 2.4.21 kernel again), as #hexdump -C
> > > /dev/loop0 shows me lots of file-contents, 
> > 
> > do you mean that you see a lot of _correct_ file contents? 
> > of files that are currently not reachable on the mounted fs?
> 
> Exactly (this is why i still have hope ;-)


> > > A reiserfsck on the crypoloop-device gives no errors:
> > 
> > ok, the root directory was lost and everething what was found on the
> > fs was connected to the lost+found.


> > > As I am afraid of doing any more harm to the fs (not sure if this
> > > is even possible ;-) I would like to know if its possible to
> > > recover the files.  If you would like to have more debugging
> > > output, I can send you that, or even give you a ssh-connection to
> > > the machine.
> > 
> > if you do not have a raw backup of the original device before
> > rebuilding the tree, let's do the following:
> > * make it, the raw backup, with the dd. probably even the copy of
> > already decrypted device to make it all simplier and faster;
> > * reiserfsck --rebuild-tree -S the_copy -l logfile
> > 
> > if this will not recover files which content you see with hexdump,
> > we will try to get them manually later.

Maybe newest reiserfsck can help you out.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
