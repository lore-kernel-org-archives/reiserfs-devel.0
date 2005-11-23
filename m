From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Plugin modifications to disk format.
Date: Wed, 23 Nov 2005 14:09:35 +0300
Message-ID: <43844DEF.7060901@namesys.com>
References: <200511230151.13675.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511230151.13675.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Hello

Peter van Hardenberg wrote:
> More codework today, so more questions.
> 
> inodes:
> ----------
> We would like to add a new field to every inode on disc. 

inode on disk is called stat data in reiser4.
To add a new field to stat data one would have to write sd extension plugin.
reiser4/plugin/item/static_stat.[ch] should help you to get started.

reiser4progs are to be updated to understand new extension plugin.

> This could monopolize 
> the "plugin_data" union on the struct. 

Which struct do you mean?

> Is there a better way? How can this be 
> achieved without breaking format compatibility?
> 
> Storage:
> -----------
> How tightly can these attribute directories be packed? Dominic Giampaulo 
> rejected a similar design to ours for efficiency purposes in the BeFS, but he 
> was not lucky enough to have the advantages of the Reiser storage layer 
> underneath. So... since we have those advantages, how tight can we pack the 
> following:
> 
> Small file with an attribute directory:
> inode
> 	->data
> 	->attributedir_inode
> 		->attributedir_ dir_file
> 			->attribute_inode
> 				->attribute_data 
> 

