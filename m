From: Yury Umanets <umka@namesys.com>
Subject: Re: user-space cmd/lib to compute hash filename ordering?
Date: Thu, 11 Sep 2003 11:17:49 +0400
Message-ID: <1063264669.29645.4.camel@haron.namesys.com>
References: <20030910140451.GB6663@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030910140451.GB6663@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bennett Todd <bet@rahul.net>
Cc: reiserfs-list@namesys.com

On Wed, 2003-09-10 at 18:04, Bennett Todd wrote:
> I'm continuing to work on my new software packaging system.
> 
> I'm going to have to make a custom archive-builder, stock cpio isn't
> suitable even though the file format will be cpio, since the pkg
> creator needs to have explicit control over the owner/group/perms
> of the files installed without having the package building user
> actually able to set those perms on real files.
> 
> Since I'm going to need to create my own cpio file builder, and
> since I've decided to teach it how to order files in the archives
> (so it can put the metadata and manifest info up at the front for
> quick access) I'm thinking it'd be sexy to add a --reiser option
> that orders all the files in the archive in reiserfs hash order, so
> a simple naive unpack will deposit files in the most efficient
> fashion into a Reiserfs filesystem.
> 
Hello,

> Is there a library routine or cmdline utility I can use to compute
> this ordering?

Actually you can use libreiserfs (progsreierfs package) or standard
reiserfsprogs. They both contains routines for generating hashes,
reiserfs supports them.

But probably it is better to cut them out and write small and simple cmd
tool for hashes generating.

Besides, there should lots of tools for generating different hashes.
They (tools) are used for discovering for instance how often particular
hash function generates collided hashes.

If you are interested, I will find out details.
> 
> Thanks,
> 
> -Bennett

-- 
umka

