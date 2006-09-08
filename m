From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfsck (3.6.19) --rebuild-tree failed
Date: Fri, 8 Sep 2006 16:48:58 +0400
Message-ID: <200609081648.58730.vs@namesys.com>
References: <200609081204.k88C4hY5008507@smtp.hispeed.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609081204.k88C4hY5008507@smtp.hispeed.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: grossnik.mailinglists@hispeed.ch
Cc: reiserfs-list@namesys.com

Hello

On Friday 08 September 2006 16:04, grossnik.mailinglists@hispeed.ch wrote:
> Vladimir
>
> >Btw, did reiserfstune say you something like the below?
> >
> >reiserfstune -B list2 /dev/hda2
> >reiserfstune: Bad block 32793 is used already in reiserfs tree. To mark it
> > as a bad block use reiserfsck
> >--fix-fixable with -B option.
>
> Yes. exactly.
> Then I did:
> reiserfsck --rebuild-tree --badblocks /root/hda3.bad /dev/hda3
>
> after 25% the --rebuild-tree stopped saing that there were bad blocks and
> that I've to provide the -B option and a badblock file. (I thought that -B
> and --badblocks were the same?)

yes

>
> I did not use the --fix-fixable option.
>
please run 
reiserfsck (3.6.19.3) --rebuild-tree --badblocks /root/hda3.bad /dev/hda3 
once again and let me see whole output of the command.
