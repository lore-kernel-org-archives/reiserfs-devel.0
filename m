From: Chris Mason <mason@suse.com>
Subject: Re: Data loss during power off
Date: 27 Jun 2002 15:08:50 -0400
Message-ID: <1025204930.1853.3.camel@tiny>
References: <15643.21032.848083.33358@laputa.namesys.com> 
	<20020627183410.20055.qmail@hm47.locaweb.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10871-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020627183410.20055.qmail@hm47.locaweb.com.br>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Henrique Faria <henrique@streamworks.com.br>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Thu, 2002-06-27 at 11:34, Henrique Faria wrote:
> Well, changing both JOURNAL_MAX_TRANS_AGE and JOURNAL_MAX_COMMIT_AGE to 0.1
> and making the following configuration for flash devices
> 
> JOURNAL_BLOCK_COUNT 512
> JOURNAL_TRANS_MAX 128
> JOURNAL_MAX_BATCH 127 
> 
> I was able to force data flush just after the file write C instructions
> (with O_SYNC or fsync). I did not get performance problems for while, maybe
> because it's a linux dedicated for a single game.
> 

All of the journal parameters should be ints.  Setting them to 0.1 won't
have quite the desired effect.

If you have JOURNAL_MAX_BATCH set to 1, you can ignore JOURNAL.*AGE, and
the transaction will commit after each write.

-chris


