From: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gj@pointblue.com.pl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 03 Sep 2004 06:36:41 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4137F4D9.7040206@pointblue.com.pl>
References: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com> <20040826121223.GG30449@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040826121223.GG30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jamie Lokier <jamie@shareable.org>
Cc: Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Jamie Lokier wrote:

>Note that file-as-directory doesn't imply that you can store just
>anything into those directories.
>
>Is it a problem to decree that "file data MUST NOT be stored in a
>metadata directory; only non-essential metadata and data computed from
>the file data may be stored"?
>  
>

That's exactly what folks seem to lost in this debate.
We (developers) want to have files as dirs to:
* be able to extract/modify file part on fly. For instance, simple .iso 
file, without need to mount it over loop (btw, if someone is going to 
redesign VFS, can we handle that kinda case too please?), .tar, or 
unzipped (kernel can handle zips) "streams". File is a stream, why 
shouldn't I have a chance to grab a stream out of archive/image than ?
* be able to store metadata, that doesn't matter on copy, and even 
should not be copied sometimes. Things like thumbnails, metainformation 
(used for search). All of these extracted from acctual file (either by 
VFS 'plugins', or by userspace application), and saved there so that it 
can be used later on. So we save some time on extracting it.


--
GJ
