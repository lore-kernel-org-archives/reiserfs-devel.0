From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: My Dad suggests a redundant copies plugin
Date: Tue, 25 Oct 2005 12:35:43 +0200
Message-ID: <20051025103543.GA11986@kruemel>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius> <435DFAA5.9050206@namesys.com>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <435DFAA5.9050206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ingo@bormuth.org

On 2005-10-25 02:28, Hans Reiser wrote:
>
> >And what is the advantage? You are not protected against a lot of disk
> >failures (only against bad blocks, right?).
>
> It is only for very important files for computers which have only one
> hard drive.  Some of the work is with changing fsck.....
> 

I agree, real backups are the major weappon against classical data loss due 
to hardware failure. 
Other quite anoying and common causes for data loss are accidentally deleted, 
overwritten or modified files. A _simple_ versioning plugin would be very
nice to have (I'd definitly use it in /etc).

Anyway, oun could then easily add the proposed redundancy feature (implemented
as the files version number zero).




-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517          '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact     ---ooO--(.)--Ooo---

