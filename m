From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Confusing modification time changes
Date: Wed, 16 Jun 2004 17:36:04 -0600
Message-ID: <1087428964.19131.1.camel@localhost.localdomain>
References: <1087420100.21692.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1087420100.21692.36.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Okay, let me apologize to everyone for wasting your time.  The latest
snapshot fixed it.  Thank you Piotr Neuman!

On Wed, 2004-06-16 at 15:08, Jonathan Briggs wrote:
> I am using Reiser4 from the March snapshot, which is still the last
> snapshot that I know of meant for testing by regular folks.  Please
> correct me if I'm wrong about that.  
> 
> Anyway, maybe this has been fixed since then.  What are the steps to
> update to the latest stuff?
> 
> Here's the problem.  I'm seeing some strange things with file
> modification times and gcc, and it messes up my kernel builds.  Here's
> an example:
[snip]
-- 
Jonathan Briggs
jbriggs@esoft.com

