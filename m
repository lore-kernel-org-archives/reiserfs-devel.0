From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Subject: Re: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Tue, 18 Jul 2006 21:37:30 +0300
Message-ID: <84144f020607181137u51639699m1fd5c86bc9d078ec@mail.gmail.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <44BAE619.9010307@namesys.com>
	 <44BAECE2.8070301@suse.com> <44BAFDC3.7020301@namesys.com>
	 <44BB0146.7080702@suse.com> <44BB3C42.1060309@namesys.com>
	 <44BBA4CF.8020901@suse.com> <44BBD4B6.5020801@namesys.com>
	 <44BBD942.3080908@suse.com> <44BBDFFC.70601@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: penberg@gmail.com
In-Reply-To: <44BBDFFC.70601@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

On 7/17/06, Hans Reiser <reiser@namesys.com> wrote:
> Replacing / with ! is hideous.  Someone added a nifty elegance to block
> device naming, and you are desecrating it.

You're free to send a patch to fix it all, you know. Until then, lets
make reiserfs consistent with rest of the kernel, ok?
