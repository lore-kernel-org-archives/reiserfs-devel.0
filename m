From: rod@tpgi.com.au
Subject: Re: Silly question, defrag
Date: Thu, 4 Apr 2002 11:42:26 +1000
Message-ID: <3CAC3C22.30357.D03D9F@localhost>
References: <3CAB48E5.9050001@namesys.com>; from reiser@namesys.com on Wed, Apr 03, 2002 at 10:24:37PM +0400
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020403164545.B21821@ultraviolet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

<snip>

> I have to wonder about your motives here, Hans. You are the one who stands
> to gain by capitalizing on newbie Unix/Linux users misunderstanding of
> filesystems based on their experience with DOS and Windows and here you
> are promoting defrag as a feature which puts your FS above others. They
> have learned to compulsively defrag their disks once a week and you are
> looking to feed their addiction. I think reiserfs is really great and a
> defrag/repacker will be nice but the above strikes me as a bit strange.
> How long has ext2 been around as the stock Linux filesystem?  More than
> long enough for people to have realized whether a defragger would be
> useful. Yet I can't think of a single distribution (of Linux or Unix in
> general) that comes with a defragger. Stephen Tweedie wrote one for it but
> nobody bothers to use it or even to include it with their distro.
> 
> Please don't perpetuate the idea that good filesystems have/need a
> defragger.
> 
> -- 
> Tracy Reed      http://www.ultraviolet.org
> "She moves in mysterious ways"
> 
I'd actually suggest you are one of the poeple perpetuating a 
fragmentation myth.

Fragmentation is an artifact of random access to disk media.  It is 
caused when the final size of a file is not known by the filesystem 
layer at write time and hence it is not possible to allocate the total 
space in one contiguous block. Log files and variable database files 
that grow over time are a classic example of this scenario. 

This leaves the the only option to defrag once the file has been 
completed OR at some user defined interval. Some fs may try to 
reduce the incidence of this but cant prevent it happening. 

The response that "some fs's that are better than DOS/WinXX and 
dont have this problem" is simply a cop out and serve to confuse the 
issue.  Its these "linux is better than winxx" statements without a 
matching technical explanation that discredit us in the eyes of others.

Certainly the behavior of DOS/WIN systems in operation (endless 
upgrades, driver installs etc) promote fragmentation however some 
linux deployments fall foul to the same problem albeit for a different 
reason. (We have been bitten by this).

Currently the only way to defrag an ext2 fs (or reiserfs) is a copy 
off, mke2fs and copy back cycle - hardly ideal.  BTW if you are 
interested in scripts that capable of totally framenting an ext2 
partition (as reported by chke2fs and demonstrated by timing a  
grep) and also a discussion of the problem - check the archives.

Hans has recognised a genuine (though not popular or talked about) 
need in some applications of the fs and is fixing it. Good on him.


Cheers
-Rod






