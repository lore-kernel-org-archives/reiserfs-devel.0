From: "Matthias Urlichs" <smurf@noris.de>
Subject: Re: Bug in reiserfsck 3.6.1-pre1
Date: Mon, 16 Sep 2002 10:13:55 +0200
Message-ID: <20020916101355.G10175@noris.de>
References: <20020916025655.E22362@noris.de> <20020916091943.A5459@namesys.com> <20020916093520.C10175@noris.de> <20020916114310.A10826@namesys.com> <20020916095858.E10175@noris.de> <20020916120531.C10884@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020916120531.C10884@namesys.com>; from green@namesys.com on Mon, Sep 16, 2002 at 12:05:31PM +0400
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi,

Oleg Drokin:
> 
> If you took the snapshot after failed reiserfsck --rebuild-tree, that should
> be enough for us to reproduce, so please make metadata available for download
> please. 
> 
I had to stop the dump (system reboot, unlreated to my failed disk).
My current plan is to run fsck with -d up to the point where it fails, then
generate the dump data and make the results available.

It'll take a bit of time -- I also have to physically move the files from
behind my home ADSL line to the company's backbone server, otherwise you'll spend the whole week trying to download the dump files.  :-/

At the moment fsck is doing this:
[...]
Pass 0 result loaded. 834934 leaves, 66434893/144 good/bad data blocks

Pass 1 (will try to insert 834934 leaves):
####### Pass 1 #######
Looking for allocable blocks .. fininshed
0%is_leaf_bad: block 16723L items 5 and 6: Wrong order of items:7161, 1295 /sec
        41402 41403 0x1 IND (1), len 496, location 500 entry count 0, fsck need 1, format new
        41402 41403 0x7c001 IND (1), len 304, location 196 entry count 65535, fsck need 1, format new
is_leaf_bad: WARNING: The leaf (16723) is formatted badly. Will be handled on the the pass2.
...

... which it'll be busy with during the next half-hour or so.

-- 
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
