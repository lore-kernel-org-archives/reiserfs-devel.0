From: Phil Howard <phil-reiserfs@ipal.net>
Subject: Re: using reiserfs as a DB
Date: Mon, 22 Apr 2002 18:16:45 -0500
Message-ID: <20020422231645.GD8407@vega.ipal.net>
References: <20020421205328.GA8407@vega.ipal.net> <20020422172009.A1109@namesys.com> <20020422174449.GC8407@vega.ipal.net> <3CC45294.2060806@priocom.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CC45294.2060806@priocom.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yura Umanets <umanets@priocom.com>
Cc: reiserfs-list@namesys.com

On Mon, Apr 22, 2002 at 09:12:36PM +0300, Yura Umanets wrote:

| Phil Howard wrote:
| 
| >"By the keys" means what?  Are the keys the filenames/paths, 
| 
| The key in reiserfs seems like four-dimentional coordinate of the 
| certain item in filesystem.
| 
| The first component is identifier of directory where given object (file 
| or directory) lies. Second - identifier of the given object. Third 
| component - offset inside object. If object is file, then offset is 
| offset inside this file, if directory - hashed name of first entry in 
| this direntry. And finally last component is type of the item (statdata, 
| direntry, direct item, indirect item).

How is the application going to know what the key is for a particular
file?  How is the application going to translate what it has as a key,
into the kind of key the raw interface uses?  How costly is this lookup?

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
