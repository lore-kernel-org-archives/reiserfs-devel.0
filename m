From: Hans Reiser <reiser@namesys.com>
Subject: Re: mongo benchmark results
Date: Sun, 25 Jul 2004 23:48:19 -0700
Message-ID: <4104A933.7020509@namesys.com>
References: <20040726055047.E145F15C29@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040726055047.E145F15C29@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs wrote:

>At http://dabbs.net/reiser4/mongo.html I've posted some benchmarks from my
>aging but available test box. All numbers were generated with the Namesys
>mm7 snapshot. The "A.INFO_R4=new" are results from a reiser4 with modified
>comparison functions as well as znode_contains_key_strict(). So, here are my
>questions:
>
>Do these results appear consistent with others' recent benchmarking? 
>  
>
Increase file_size to 8k, and then we can compare.  This will reduce 
reiser4's space savings from 19% to 9%, but it will probably increase 
performance.

Your work had a remarkable effect on the create phase.  Very good work.  
I don't know why the impact was not larger for the stats phase.

Elena, please reproduce his results on our hardware.

>Should I be using particular mount options during benchmarking?
>I would think running mongo would be necessary to ensuring that reiser4 mods
>are 'safe,' but it is sufficient?
>Viz the prior question, is there a recommended test regimen or regression
>suite?
>
>
>I started to dig into mongo a bit and noticed that it does not appear to
>vary the file & dir _names_ it generates. Most appear to be ~7 characters
>long with a pattern of 'f' followed by some number. Isn't this a) atypical
>of file/dir name distribution and b) favorable to/biased towards the "short
>name" code? IOW, if R4_LARGE_KEYS is the default and all generated test file
>names' lengths < 15 characters,
>
You are encouraged to survey filesystems and supply a realistic filename 
generator.

In practice, most filenames are less than 15 characters. 

Another thing we need to do is add a file data generator that is based 
on slicing and dicing a linux kernel tarball, because we won't be able 
to do a good benchmark of the compression code until we do so.

> then the large file name code is not being
>covered or benchmarked. Perhaps I'm mixing apples and oranges (code coverage
>and benchmarking). 
>
>
>Just curious,
>
>David
>
>
>
>
>
>  
>

