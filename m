From: Oleg Drokin <green@namesys.com>
Subject: Re: how long is reiserfsck expected to run?
Date: Sat, 24 May 2003 13:37:10 +0400
Message-ID: <20030524093710.GA15753@namesys.com>
References: <200305241131.40837.pegasus@nerv.eu.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200305241131.40837.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jp <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, May 24, 2003 at 11:31:40AM +0200, jp wrote:

> By now it is running for 30h (500gb mail spool). How much more can i expect it 
> to run? How can i get some indication whether it's 10% done, 50% done or 90% 
> done?

It can take pretty long time.
(it prints percentage for each pass.)
But on the other hand we have some useful optimisations that should make this process
much more fast in cases like you describe.
This code is being tested by our testers, but it seems to be pretty
stable and numerous people tried it without any bad effects.
I can send you the latest version if you want to try it.

Bye,
    Oleg
