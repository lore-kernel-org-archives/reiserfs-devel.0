From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with my HDD
Date: Thu, 30 May 2002 09:14:10 +0400
Message-ID: <20020530091410.B3922@namesys.com>
References: <10512850437.20020529194929@starfall.de> <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Brockway <robert@timetraveller.org>
Cc: Cookie-Monster <cookie.monster@starfall.de>, reiserfs-list@namesys.com

Hello!

On Thu, May 30, 2002 at 09:45:50AM +1000, Robert Brockway wrote:

> If you can I'd consider getting an image of the drive.  It may help with 
> data recovery later.  something like:
> dd if=/dev/sda1 of=/bigfilesystem/diskimage

That does not work on bad hard drives, resulting image would be almost useless.
BTW, this way it stops on first read error.

Bye,
    Oleg
