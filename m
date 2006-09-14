From: cmaurand <cmaurand@bluetarp.com>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Thu, 14 Sep 2006 10:01:52 -0400
Message-ID: <450960D0.9020203@bluetarp.com>
References: <200609131451.42474.lists@qutek.net> <ee9s4k$f58$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee9s4k$f58$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter <sw98234@hotmail.com>
Cc: reiserfs-list@namesys.com


SCO has done this solution, thats why its such a dog.

Peter wrote:
> On Wed, 13 Sep 2006 14:51:39 -0600, Quinn Harris wrote:
>> Thoughts?
>>
> 
> Yes. Why on earth would you do this? By copying the files and renaming and
> hardlinking them is nothing a sysadmin would ever do. Just by copying you
> are allowing reiser to optimize the dir. You're trying to duplicate what a
> tree-based design does automatically. Moreover, remember that reiser packs
> files into clusters so that you may read more than just your one file from
> time to time which could end up adding time to your test.
> 
> If reiser needs speedup it certainly won't be done by renaming files!
> 
> JM$0.02
> 


-- 
Curtis Maurand
Senior Network & Systems Engineer
BlueTarp Financial, Inc.
443 Congress St.
6th Floor
Portland, ME 04101
207.797.5900 x233 (office)
207.797.3833	  (fax)
mailto:cmaurand@bluetarp.com
http://www.bluetarp.com
