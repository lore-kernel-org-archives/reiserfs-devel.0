From: Hans Reiser <reiser@namesys.com>
Subject: Re: Several questions about encrypted filesystem
Date: Tue, 17 Jun 2003 20:02:09 +0400
Message-ID: <3EEF3B81.9060709@namesys.com>
References: <3AA03342E913FA4BA6D8BD0732BFC74B020F443A@pdsmsx402.pd.intel.com> <3EEEFE60.4C86EEE6@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14581-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EEEFE60.4C86EEE6@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shushkin <edward@namesys.com>
Cc: "Zhao, Forrest" <forrest.zhao@intel.com>, reiserfs-list@namesys.com

V4 performs individual file encryption and compression, and it performs 
it at flush to disk time rather than at every write for performance reasons.

We are going to move reiserfs gradually more and more towards encryption 
based security, it is especially important for distributed file systems.

How we integrate into the PKI is still being designed, right now we are 
working on making encryption and compression work in the lower layers, 
and later we will look at how processes should inherit keys from each 
other, etc.

-- 
Hans


