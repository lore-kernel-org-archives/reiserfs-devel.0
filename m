From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Thu, 16 Sep 2004 20:55:38 +0100
Message-ID: <200409162055.38364.tdickenson@geminidataloggers.com>
References: <20040915151803.vl9es48kkosg4k88@www.wagland.net> <16712.21927.550122.367489@thebsh.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16712.21927.550122.367489@thebsh.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Nikita Danilov <nikita@clusterfs.com>, Hans Reiser <reiser@namesys.com>

On Wednesday 15 September 2004 15:45, Nikita Danilov wrote:

> The real problem is that in reiser4 regular files and directories are
> indistinguishable by design. 

Indistinguishable?

Ive been following the reiser4 message so far and felt comfortable with 
performing directory-like operations on files. But I think this is the first 
mention that files and directories would be *indistinguisable*. What does 
'ls' show, and how?

> and one can do read("directory"), or, even, execve("directory") to
> one's heart content.

I think thats the first mention of performing file operations on a directory.

-- 
Toby Dickenson
