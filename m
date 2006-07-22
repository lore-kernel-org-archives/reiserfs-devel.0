From: Jindrich Makovicka <makovick@gmail.com>
Subject: Re: rephrase..
Date: Sat, 22 Jul 2006 13:36:22 +0200
Message-ID: <20060722133622.262bc698@holly.localdomain>
References: <44C20290.4080401@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C20290.4080401@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sat, 22 Jul 2006 12:48:48 +0200
Dirk <noisyb@gmx.net> wrote:

> will fsck.reiser4 --build-fs repair the partition by formatting it??

No, you should get your data back, unless you hit a bug in fsck (I
am not aware of any such report recently). The only problem with
fsck.reiser4 is that it's hard to figure out what files got actually
damaged - most of its messages are probably useful only to people
familiar with Reiser4 internals. If you are running tripwire or
something similar, I recommend rechecking the files as soon as you
repair the filesystem.

-- 
Jindrich Makovicka
