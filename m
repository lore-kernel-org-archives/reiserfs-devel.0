From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: rebuild-tree aborted
Date: Sun, 26 Mar 2006 17:02:21 +0400
Message-ID: <1143378141.23834.46.camel@tribesman.namesys.com>
References: <4425AEC3.5010100@rpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4425AEC3.5010100@rpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Dugas <dugass@rpi.edu>
Cc: reiserfs-list@namesys.com

Hello

On Sat, 2006-03-25 at 15:57 -0500, Scott Dugas wrote:
> I have tried reiserfsck --rebuild-tree 11 times. Each time the pass 0 
> finishes successfully, but has been improving (more or less) each time. 
> Pass 1 fails. it fails on one of three different blocks each time 
> (2785605, 9671269, or 48169048), but with different amounts left to 
> scan. It returns the error:
> 
> The problem has occurred looks like a hardware problem (perhaps
> memory). Send us the bug report only if the second run dies at
> the same place with the same block number.
> 
> build_the_tree: Nothing but leaves are expected. Block 9671269 - unknown
> 
> 
> I'm using reiserfsck 3.6.19 with gentoo kernel sources 2.6.14-r5. This 
> is on an external drive (/dev/sda1).
> 
> is there any way to fix this?
> 
I would propose you to try
1. to attach the drive to anotrher box and do --rebuild-tree
2. to copy (dd_rescue) /dev/sda1 to another hard drive and do
--rebuild-tree on the copy

> --Scott
> 

