From: Chris Mason <mason@suse.com>
Subject: Re: Stacktrace
Date: Thu, 16 Dec 2004 08:35:21 -0500
Message-ID: <1103204121.16231.299.camel@watt.suse.com>
References: <41C18AF1.20205@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41C18AF1.20205@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joachim Reichelt <Reichelt@gbf.de>
Cc: reiserfs-list@namesys.com

On Thu, 2004-12-16 at 14:17 +0100, Joachim Reichelt wrote:
> Dear all,
> I just got in my dmesg:
> 
> reiserfs/1: page allocation failure. order:0, mode:0x21

This is an atomic allocation, which is allowed to fail.  You can ignore
the message (which comes from the VM), later versions of the suse kernel
don't even print it for atomic failures.

-chris


