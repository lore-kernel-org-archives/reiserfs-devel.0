From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: ReiserFS to Reiser4 Migration
Date: Tue, 22 Feb 2005 10:49:59 +0300
Message-ID: <1109058599.21144.332.camel@tribesman.namesys.com>
References: <ce5542b162871b6c43a7839c0d661e39@stanford.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ce5542b162871b6c43a7839c0d661e39@stanford.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Can Sar <csar@stanford.edu>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2005-02-22 at 01:15, Can Sar wrote:
> Hi,
> 
> I've desperately been looking for a tool to migrate from ReiserFS to 
> Reiser4 with no luck, I searched on the web for several hours but only 
> found instructions to back up to another device and then mkfs on the 
> old ReiserFS partition. Are these sources really right or is there such 
> a tool somewhere? 

No, there is no special converting tool.

> What if I want to upgrade a volume of a Terabyte in 
> size, would I really need to find a backup volume with that much space? 
> Is such a program in the works then?
> 
No, at least in Namesys.
You could take a look at http://directory.fsf.org/all/ConvertFS.html,
though.

Please remember that reiser4 is yet in experimental/development state.

> Thank you very much for your help,
> Can Sar
> 
> 

