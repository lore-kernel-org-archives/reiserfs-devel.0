From: Hans Reiser <reiser@namesys.com>
Subject: Re: Archiver
Date: Mon, 28 Apr 2003 14:20:18 +0400
Message-ID: <3EAD0062.7060603@namesys.com>
References: <3EACFF00.6030507@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EACFF00.6030507@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joachim Reichelt <Reichelt@gbf.de>
Cc: reiserfs-list@namesys.com

Joachim Reichelt wrote:

> Dear all,
>
> I know, it is a little bit out of topic, but we are looking for 
> Software to archive our data held on
> ~400GB reiser fs.
> We want to have exact one copy on tape of each file that is on our 
> system at e.g. midnight.
> Only new or changed files should go to tape.
> Tapes are in an robot system of ~2TB.
>
lvm snapshots and dd or tar?

-- 
Hans


