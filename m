From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: updated data logging available
Date: Sat, 12 Jul 2003 05:03:54 +0200
Message-ID: <3F0F7A9A.7000003@netscape.net>
References: <1057958462.13318.78.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1057958462.13318.78.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/11/03 23:22, mason@suse.com wrote:
> Hello all,
> 
> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.22
> 
> Has a merge of the data logging and quota code into 2.4.22-pre4 (should
> apply to -pre5).  Overall, the performance of pre5 + reiserfs-jh is nice
> and smooth, I'm very happy with how things are turning out.
> 
> Thanks to Oleg for merging data logging with his reiserfs warning
> patches and hole performance fixes.
> 
> The relocation and base quota code is now in, so our number of patches
> is somewhat smaller.  The SuSE ftp server might need an hour or so to
> update, please be patient if the patches aren't there yet.
> 
> -chris
> 

They patch and run fine even with search_reada-5 (from this list) and
this funny-fast-responding HZ=1000 setting @ 2.4.22-pre5 at the moment
(greatest: no handcrafting needed on here with mostly only rml-preempt
(except for "fixing" this one) ;-) ).

And as I subjectively feel, after 2.4.21-final it goes like you say:
"performance is nice and smooth" now. The "smoothness" (however one may
measure, I keep listening to my near notebook disks for now) seems to
have increased greatly with 2.4.22-pre(3&5). E.g no unneeded often disk
transfers take place as they did in 2.4.21-final. And desktop usage
patterns (loading Netscape 7.1, OOo 1.1 and some overheaded apps like
that) didn't slowdown in any kind.


Great work done for ReiserFS!!!


Many thanks to the whole team,

 Manuel


[OT: BTW, if someone experienced performance problems with OpenOffice
1.0.x_y just try OOo 1.1rc1 - it's amazingly fast and fixes many
prereleases' problems, too.]

