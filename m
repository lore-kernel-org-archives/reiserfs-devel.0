From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: MAX_TRANS_AGE tuning
Date: Wed, 06 Oct 2004 14:37:33 +0400
Message-ID: <1097059052.13026.19.camel@tribesman.namesys.com>
References: <e96ff12004100405291b9f174c@mail.gmail.com>
	 <e96ff1200410040532787d4c62@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22007-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e96ff1200410040532787d4c62@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ash <ashrat@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2004-10-04 at 16:32, Ash wrote:
> Sorry, accidently sent the previous message before completing the compose. :-(
> 
> What is the difference between JOURNAL_MAX_TRANS_AGE and JOURNAL_MAX_COMMIT_AGE 
> defined in reiserfs_fs.h ?
> 
> I see that both are set to 30 as default. Would reducing the either of
> them to lower
> values give more persistency in filesystem operations in post-crash scenarios ?
> 

Reducing JOURNAL_MAX_TRANS_AGE should cause transactions to flush
earlier. Once a transaction is flushed - it will be replaied on
post-crash reboot.

> What are the side-effects of changing these values ?
> 
> Thanks,
> Ash
> 
> 
> On Mon, 4 Oct 2004 17:59:48 +0530, Ash <ashrat@gmail.com> wrote:
> > Hi
> > 
> > What is the difference between
> >
> 

