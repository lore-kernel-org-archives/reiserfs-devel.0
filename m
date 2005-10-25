From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: My Dad suggests a redundant copies plugin
Date: Tue, 25 Oct 2005 12:25:04 +0200
Message-ID: <435E0800.2080403@muenning.com>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius> <435DFAA5.9050206@namesys.com> <20051025093958.GB9299@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051025093958.GB9299@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: ReiserFS List <reiserfs-list@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>

Sander wrote:
> Hans Reiser wrote (ao):
> 
>>It is only for very important files for computers which have only one
>>hard drive. Some of the work is with changing fsck.....
> 
> 
> Well, if the files are important, then you should have backups anyway,
> whatever raid or similar you have. I still don't see an advantage in
> having two versions of a file on one disk.

Here is one: something bad happens with your FS so you need to fsck,
rebuild-tree (or what the corresponding thing for reiser4 is) or
something like this. Having important files duplicated improves the
chance that at least one copy is still intact afterwards as depending on
the grade of corruption rebuilt fs may show the same files but contents
may differ. (verifying which copy is OK is not in the scope of this writing)

Yes, having backups is better but that wouldn't help if it's your
laptop, the backups are 2000 miles away in your office and you have only
some Linux Boot CD?! ;-)

I know, that doesn't happen often but I've had similar situations. As
I've allways managed to help me somehow missing this feature wouldn't
make me cry but I would probably use it. Just my two cents.

> But then again, that should not hinder anyone :-)

