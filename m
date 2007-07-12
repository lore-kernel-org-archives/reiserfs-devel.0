From: Zan Lynx <zlynx@acm.org>
Subject: Re: 2.6.22-rc6-mm1 reiser4_tree_by_page NULL pointer
Date: Thu, 12 Jul 2007 14:31:04 -0600
Message-ID: <46968F88.7070300@acm.org>
References: <1184090582.6933.20.camel@localhost> <469523FA.7010308@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <469523FA.7010308@namesys.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, "Vladimir V. Saveliev" <vs@namesys.com>

Edward Shishkin wrote:
> 
> I have found the bug, which kills data
> when booting after crash, power loss, etc.
> The patch is attached.
> Please, ping me, if it doesn't help..

It appears to be holding up well so far.  About 5 hours of Gentoo 
updating and compiling.

