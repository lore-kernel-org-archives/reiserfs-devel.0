From: Oleg Drokin <green@namesys.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 09:20:34 +0400
Message-ID: <20020516092034.B6880@namesys.com>
References: <OFDC95E87B.B541379E-ON85256BBA.0074ED07@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10320-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OFDC95E87B.B541379E-ON85256BBA.0074ED07@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 15, 2002 at 04:22:22PM -0500, Steve Pratt wrote:

> A couple of questions about the ReiserFS utilities.  First, does ReiserFS
> support labels or not?  FAQ says no and refers to lack of space in the 3.5
> superblock. Neither 3.5 nor 3.6 superblock appear to have a label field,
> but mkfs has an option for it.

Labels are supported in reiserfs v3.6 format. (2.4 supopr was merged into
2.4.19-pre3, if I remember correctly).

> Second, what is the option to keep fsck from prompting for 'Yes' when
> running.  I need to exec this without additional input.  Seems like quiet
> should do it, but it doesn't.

Hans has a decision that this should not be done for now because
reiserfsprogs are in active bugfixing stage.
You can circumvient this by echo Yes | reiserfsck ...
if you need.

Bye, 
    Oleg 
