From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files
 according to semantic.
Date: Tue, 16 Mar 2004 22:22:11 -0500 EST
Message-ID: <94121091767-BeMail@cr593174-a>
References: <20040317024931.GB5731@exavio.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17260-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040317024931.GB5731@exavio.com.cn>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Isaac Claymore <clay@exavio.com.cn>
Cc: reiserfs-list@namesys.com

Isaac Claymore wrote on Wed, 17 Mar 2004 10:49:31 +0800:
> I guess this kind of stuff can be done in user space, well and
> elegantly. Either a specialized application(e.g. iTunes), or some kind
> of user space filesystem will do. [...]

I (and others) think it would be better for this to be done at the file
system level.  That way you can leverage all sorts of other utilities and
programs.  Like using "cd" to change directory to the query results
virtual directory of all files by a particular artist, then being able to
use the usual file manipulation tools on them.  The general idea is to
reduce the number of separate name spaces to make life for the user and
programmer simpler and more efficient.

- Alex
