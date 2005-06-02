From: Dan Oglesby <doglesby@teleformix.com>
Subject: Re: 13000Gig partition badblock check is the same -- do a reiserfsck
 again ?
Date: Thu, 02 Jun 2005 16:32:42 -0500
Message-ID: <429F7AFA.40503@teleformix.com>
References: <1117392967.29669.ezmlm@namesys.com> <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu> <429AAFDC.4050208@mh.be> <429C6BE8.4090906@teleformix.com> <429C7153.8000008@mh.be> <429C7E46.9090507@teleformix.com> <429F199A.5020900@mh.be>            <429F17A2.2070102@teleformix.com> <200506022103.j52L3A9A012873@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506022103.j52L3A9A012873@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu wrote:
> On Thu, 02 Jun 2005 09:28:50 CDT, Dan Oglesby said:
> 
> 
>>latest versions.  Took two days to run, but it completed, and I ended up 
>>only losing 2 files out of over 1.1 million files on a 1TB RAID-5 
>>array.  That's not too bad, considering how many times the machine went 
>>up and down due to bad power in the building.
> 
> 
> Buy a UPS. Now.  Even if it's just a big battery that will only keep you
> running for 10 mins - at least that will give you enough time to do a clean
> shutdown -h rather than get stuff trashed.
> 
> If you can't get money for it, just point at the lost-productivity costs
> the *next* time the terabyte takes 2 days to recover.. and remind the boss that
> you could be down for 2 days every time the lights flicker.. ;)

That's just it...  Bad power in the building was due to the building's 
UPS (big sucker, attached to a Cummins diesel generator) failing. 
That's been fixed, so the power in the building is OK again.

Previous to the UPS going down, this building hadn't lost power in many 
years.  We don't have to deal with this kind of problem very often.  ;-)

I've been using the array, and it's going great.  ReiserFS proves to be 
robust, as long as the hardware, power, and software on the system are 
in good working order.

--Dan
