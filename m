From: Hans Reiser <reiser@namesys.com>
Subject: Re: [RFC] Pathname Semantics with //
Date: Wed, 08 Sep 2004 23:10:45 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413FF3E5.1010103@namesys.com>
References: <20040909214641.6977B15C8B@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040909214641.6977B15C8B@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>

David Dabbs wrote:

>Before we get too far into the merits of implementation-specific pathname
>resolution for paths starting with //, it seems wise to address the POSIX
>implications of any duality implied by this (or any other) semantic change. 
>
>This is the first issue raised in my original post. Gunnar Ritter also
>addressed it this lkml post 
>[http://marc.theaimsgroup.com/?l=linux-kernel&m=109475512921055&w=2]
>
>
>POSIX demands that open() must fail with ENOTDIR if "a component of the path
>prefix is not a directory." If resolving a path using alternate pathname
>resolution 
>
what is alternate pathname resolution?  I don't understand this 
paragraph somehow, probably my error.

>permits files to "act as" directories, is it legal to fail with
>ENOTDIR when the VFS/filesystem does not support the capability even though
>the final pathname component is of type S_IFREG? 
>
>Also open() must fail with EACCES if "search permission is denied on a
>component of the path prefix..." Under normal circumstances this means no
>execute permission on a /directory/ path component. What does it mean when
>path prefixes may be of type S_IFREG? Does this mean that normally
>non-executable files must have execute permissions set? This is an important
>security issue.
>  
>
I think we need two executable bits, one for searching directories and 
once for executing the default file of the directory.

>BTW, a "Strictly Conforming POSIX Application"
>[http://www.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap02.html#tag_
>02_02_01]
>
>#Shall accept any implementation behavior that results from actions it takes
>#in areas described in IEEE Std 1003.1-2001 as implementation-defined or
>#unspecified, or where IEEE Std 1003.1-2001 indicates that implementations
>#may vary.
>
>How should we interpret this?
>
>
>David
>
>
>
>
>
>
>
>  
>

