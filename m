From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiser3: data=journal causes panic in 2.6.29.4
Date: Sun, 21 Jun 2009 12:11:51 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.0906211205590.6439@bogon>
References: <19003.42003.291323.769232@fisica.ufpr.br> <alpine.DEB.2.01.0906202254510.6439@bogon> <19006.20057.249908.171552@fisica.ufpr.br>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19006.20057.249908.171552@fisica.ufpr.br>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos Carvalho <carlos@fisica.ufpr.br>
Cc: reiserfs-devel@vger.kernel.org

On Sun, 21 Jun 2009, Carlos Carvalho wrote:
> It's not in the man page; it's mentioned in some posts.

And it's been in fs/reiserfs/super.c for quite some time; commit bd4c625c 
is from 07/2005 where the mount options merely got formatted - I wonder 
why this hasn't been documented yet. Then again, the latest manpages 
tarball still lists the mount(8) manpage as updated on 2004-12-16...

-- 
BOFH excuse #210:

We didn't pay the Internet bill and it's been cut off.
