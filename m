From: Oleg Drokin <green@namesys.com>
Subject: Re: clm-6005
Date: Mon, 15 Apr 2002 09:23:54 +0400
Message-ID: <20020415092354.B1116@namesys.com>
References: <20020415013629.GA13011@nikolas.hn.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020415013629.GA13011@nikolas.hn.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Orlov <nick.orlov@mail.ru>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 14, 2002 at 09:36:29PM -0400, Nick Orlov wrote:

> two days ago I have made a decision to make /usr readonly and remount it
> rw only for upgrades (my /usr is on reiserfs).
> today I have found next messages in my kern.log:
> Apr 14 12:06:21 nikolas kernel: clm-6005: writing inode 275524 on
> readonly FS
> Apr 14 12:06:21 nikolas kernel: clm-6005: writing inode 275475 on
> readonly FS
> Apr 14 13:44:06 nikolas kernel: clm-6005: writing inode 82746 on
> readonly FS
> ....and so on....

Hm. I am not sure of the cause yet, may be this is atime is tried to be updated
on previously open files or something like that.
Useless/strange warnings should go away for sure.
I will come with the patch once I figure where the problem lies.

Thank you for your report.

Bye,
    Oleg
