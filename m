From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: kernel 2.4.27 reiserfs quotas patch
Date: Tue, 24 Aug 2004 11:08:18 +0200
Message-ID: <200408241108.18527.christian.mayrhuber@gmx.net>
References: <cgd0l9$6o0$1@sea.gmane.org> <20040824001923.0b9b282f.lists@mjh.name> <200408241046.01649.bostjan.skufca@domenca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20474-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408241046.01649.bostjan.skufca@domenca.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 24 August 2004 10:46, Bostjan Skufca @ domenca.com wrote:
> On machines where I do not want kernel modules enabled I solved the build
> problem by modifying file "fs/reiserfs/journal.c". Just comment out the
> first line of code like this:
>
> //#define EXPORT_SYMTAB
>
> Works for me without problems...
>
> Christian: What is all about that fsync() bug? Is it serious? Are there any
> special conditions to be met to actually see the results of it?

Have a look at:
http://marc.theaimsgroup.com/?l=reiserfs&m=109250555704899&w=2

You may want to ask Chris Mason what the state of the patch update is.


-- 
lg, Chris
