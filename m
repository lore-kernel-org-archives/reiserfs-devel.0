From: Redeeman <redeeman@metanurb.dk>
Subject: Re: some basic questions
Date: Wed, 05 Nov 2003 18:05:33 +0100
Message-ID: <1068051933.32075.10.camel@redeeman.linux.dk>
References: <1067880381.17873.9.camel@redeeman.linux.dk>
	 <1068044839.32072.0.camel@redeeman.linux.dk>  <87d6c6ahjz.fsf@uhoreg.ca>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87d6c6ahjz.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

the reiserfs test partition i have is version 3.6

On Wed, 2003-11-05 at 17:47, Hubert Chan wrote:
> >>>>> "Redeeman" == Redeeman  <redeeman@metanurb.dk> writes:
> 
> Redeeman> nobody seems to answer :(
> Redeeman> On Mon, 2003-11-03 at 18:26, Redeeman wrote:
> 
> [...]
> 
> Redeeman> is there anything i should know?
> 
> Reiserfs (v3) only does metadata journalling by default.  That means
> that the filesystem will always be consistent, but you may still get
> data loss.  In order to make sure you don't have any data loss, you
> should use Chris Mason's data logging patches[1], and add either
> "data=ordered" or "data=logging" to your filesystem options.  (Chris
> said that data=ordered would be default eventually, but I'm not sure if
> that has happened yet.)
> 
> [1] ftp://ftp.suse.com/pub/people/mason/patches/data-logging/
-- 
Regards, Redeeman
()  ascii ribbon campaign - against html e-mail 
/\                        - against microsoft attachments

