From: David Masover <ninja@slaphack.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 01 Jul 2005 03:17:24 -0500
Message-ID: <42C4FC14.7070402@slaphack.com>
References: <20050629001847.GB850@frodo> <200506290453.HAA14576@raad.intranet> <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Wedgwood <cw@f00f.org>
Cc: Al Boldi <a1426z@gawab.com>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Chris Wedgwood wrote:
> On Wed, Jun 29, 2005 at 07:53:09AM +0300, Al Boldi wrote:
> 
> 
>>What I found were 4 things in the dest dir:
>>1. Missing Dirs,Files. That's OK.
>>2. Files of size 0. That's acceptable.
>>3. Corrupted Files. That's unacceptable.
>>4. Corrupted Files with original fingerprint. That's ABSOLUTELY
>>unacceptable.
> 
> 
> disk usually default to caching these days and can lose data as a
> result, disable that

Not always possible.  Some disks lie and leave caching on anyway.
