From: Sander <sander@humilis.net>
Subject: Re: Some ReiserFS failure situations and questions
Date: Fri, 5 Mar 2004 07:58:37 +0100
Message-ID: <20040305065837.GE15906@favonius>
References: <20040303224848.GF31472@dbz.icequake.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17093-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040303224848.GF31472@dbz.icequake.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Underwood <nemesis-lists@icequake.net>
Cc: reiserfs-list@namesys.com

Ryan Underwood wrote (ao):
> I have another problem with reiserfs that happens occasionally. On
> reiserfs and only reiserfs partitions, when a crash and journal
> recovery happens, occasionally two files that were open will have
> their contents "exchanged". For example, a piece of the text file I
> was editing ends up in a licq contact file, or an emule download gets
> a piece of a web page from opera in it. Is this a common problem, and
> what is the best way to keep it from happening?

The 'problem' is that reiserfs only does meta-data journaling. This
gives you a consistent filesystem after a crash from the computers'
point of view. Your data is still a bit toast though.

Nowadays (with a current kernel and some patches?) you have a few extra
mount options for reiserfs. The default with the old kernels is
'data=writeback'. In this mode the data can be written after the
metadata is commited.

With the patched kernel, the default is 'data=ordered'. In this mode the
data hits the disk before the metadata hits the disk. This should give
much more consistent data after a crash.

With the patched kernel you can also choose 'data=journal'. Then
meta-data and data is journalled, and thus fs consistency is more or
less certain.

In general it is assumed that the first one is the fastest, and the last
one the slowest, but in some situations this differs.

The new default (ordered) is a great improvement IMHO.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
