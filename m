From: Hans Reiser <reiser@namesys.com>
Subject: Re: [RFC] Pathname Semantics with //
Date: Thu, 09 Sep 2004 22:40:03 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <41413E33.5000501@namesys.com>
References: <20040910030206.E29B015D9E@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040910030206.E29B015D9E@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>, Peter Foldiak <Peter.Foldiak@st-andrews.ac.uk>

David Dabbs wrote:

>  
>
>
> Do you have a proposal to
>expose metadata on a directory such that it 
>
>a) allows one to distinguish a directory entry from directory metadata,
>  
>
this should be only a style convention, not a deep semantic difference. 
Maybe Peter can comment on this.

>b) uses only already-reserved pathname character(s),
>  
>
this is not important in practice

>c) doesn't require any reserved name,
>  
>
this is not important in practice

>d) is the same delimiter used for file metadata and
>  
>
?

>e) doesn't butt heads with Sus?
>  
>
standards are not the future, they are efforts to make the past less 
painful.


