From: Hans Reiser <reiser@namesys.com>
Subject: Re: Plugin modifications to disk format.
Date: Fri, 02 Dec 2005 01:52:57 -0800
Message-ID: <43901979.2060600@namesys.com>
References: <200511230151.13675.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511230151.13675.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

Peter van Hardenberg wrote:

>More codework today, so more questions.
>
>inodes:
>----------
>We would like to add a new field to every inode on disc. This could monopolize 
>the "plugin_data" union on the struct. Is there a better way? How can this be 
>achieved without breaking format compatibility?
>
>Storage:
>-----------
>How tightly can these attribute directories be packed? Dominic Giampaulo 
>rejected a similar design to ours for efficiency purposes in the BeFS, but he 
>was not lucky enough to have the advantages of the Reiser storage layer 
>underneath. So... since we have those advantages, how tight can we pack the 
>following:
>
>Small file with an attribute directory:
>inode
>	->data
>	->attributedir_inode
>		->attributedir_ dir_file
>			->attribute_inode
>				->attribute_data 
>
>  
>
define how an attribute differs from a file, usefully that is.....

Hans
