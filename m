From: "David Dabbs" <david@dabbs.net>
Subject: mongo benchmark results
Date: Mon, 26 Jul 2004 00:49:49 -0500
Message-ID: <20040726055047.E145F15C29@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19800-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


At http://dabbs.net/reiser4/mongo.html I've posted some benchmarks from my
aging but available test box. All numbers were generated with the Namesys
mm7 snapshot. The "A.INFO_R4=new" are results from a reiser4 with modified
comparison functions as well as znode_contains_key_strict(). So, here are my
questions:

Do these results appear consistent with others' recent benchmarking? 
Should I be using particular mount options during benchmarking?
I would think running mongo would be necessary to ensuring that reiser4 mods
are 'safe,' but it is sufficient?
Viz the prior question, is there a recommended test regimen or regression
suite?


I started to dig into mongo a bit and noticed that it does not appear to
vary the file & dir _names_ it generates. Most appear to be ~7 characters
long with a pattern of 'f' followed by some number. Isn't this a) atypical
of file/dir name distribution and b) favorable to/biased towards the "short
name" code? IOW, if R4_LARGE_KEYS is the default and all generated test file
names' lengths < 15 characters, then the large file name code is not being
covered or benchmarked. Perhaps I'm mixing apples and oranges (code coverage
and benchmarking). 


Just curious,

David



