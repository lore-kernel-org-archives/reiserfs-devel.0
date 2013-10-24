From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH] reiserfs: remove duplicate define
Date: Thu, 24 Oct 2013 07:28:28 +0200
Message-ID: <5268AFFC.8020106@free-electrons.com>
References: <1382342097-2991-1-git-send-email-michael.opdenacker@free-electrons.com> <20131023095040.GD1275@quack.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20131023095040.GD1275@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, jeffm@suse.com, marco.stornelli@gmail.com

Hi Jan,

Thank you for your review!

On 10/23/2013 11:50 AM, Jan Kara wrote:
> On Mon 21-10-13 09:54:57, Michael Opdenacker wrote:
>> This patch removes a duplicate define in fs/reiserfs/reiserfs.h
>   Hum, so the duplicate define certainly isn't nice but it's really a
> result of a namespace collision between return codes of two different (sets
> of) functions. So deleting the duplicate isn't really solving the problem,
> just hiding it. So I'd prefer more one of the following two solutions:
> 1) Just ignore the problem. Reiserfs is mostly dead and this isn't likely to
> cause any subtle issues.
> 2) Prefix the return codes somehow so that those two error namespaces don't
> clash. As a bonus you can convert defines to enums but I'm not sure that's
> worth the bother (prefixing is a simple search & replace so that should be
> trivial, well except for the CARRY_ON case).
I like your second solution, adding a prefix to avoid collisions between
two error namespaces, all the more as this looks like a good solution
for similar issues that I found.

Thanks again,

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
+33 484 258 098

