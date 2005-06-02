From: Dan Oglesby <doglesby@teleformix.com>
Subject: Re: 13000Gig partition badblock check is the same -- do a reiserfsck
 again ?
Date: Thu, 02 Jun 2005 09:28:50 -0500
Message-ID: <429F17A2.2070102@teleformix.com>
References: <1117392967.29669.ezmlm@namesys.com>            <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com> <429F199A.5020900@mh.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429F199A.5020900@mh.be>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Matthias Barremaecker wrote:

> Hi,
>
> The first time, I did a bad block check, and feeded that list to the 
> reiserfsck --rebuild-tree.
>
> The reiserfsck FAILED in phase 2.
>
> Now I have done a bad block check again and the list is the same, so 
> no new bad blocks have occoured.
>
> Is it sane to do the reiserfsck --rebuild-tree again, or will it fail 
> again?
>
> thanx.
>
> kind regardes,
>
> Matthias.


What error did you get?  Same as before?

FWIW, I was able to successfully recover my corrupted array!  Had to 
update all hardware to latest BIOS/Firmware, all software and drivers to 
latest versions.  Took two days to run, but it completed, and I ended up 
only losing 2 files out of over 1.1 million files on a 1TB RAID-5 
array.  That's not too bad, considering how many times the machine went 
up and down due to bad power in the building.

--Dan
