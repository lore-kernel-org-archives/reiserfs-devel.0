From: Oleg Drokin <green@namesys.com>
Subject: Re: EVMS Reiser FSIM
Date: Tue, 4 Jun 2002 10:09:09 +0400
Message-ID: <20020604100909.A1389@namesys.com>
References: <OFB5110BE1.9C046DEC-ON85256BCD.00735354@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OFB5110BE1.9C046DEC-ON85256BCD.00735354@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Jun 03, 2002 at 04:03:32PM -0500, Steve Pratt wrote:
 
> Let me know if this still doesn't work.

Ok, now I am able to compile and boot the kernel, and evms gui starts up.

But now the problem is all the screens except plugin lists are empty.

Whenever I select some operation from the menu (create, convert or whatever),
I am represented with empty window that says "No items were found matching
the search criteria" (sometimes the window is persent instantly, sometimes
there is a windo with some items, but when I choose one of the items
and press "Next" button, the empty window appears).

I read the FAQ and since I run non-devfs enabled kernel, I run
evms_devnode_fixup. First time it failed:
# ./evms_devnode_fixup
evms_devnode_fixup -- updating the EVMS device node tree...
evms_devnode_fixup -- ERROR: return code from evms_update_evms_dev_tree() was -9.

Second time it succeed:
# ./evms_devnode_fixup
evms_devnode_fixup -- updating the EVMS device node tree...
evms_devnode_fixup -- Finished.

But still not a single entry in evsmgui tool.

# ./evms_gather_info
############################################################
                    Data from /proc/evms
############################################################


/proc/evms/info:
Enterprise Volume Management System: Info
EVMS info level: 5 (default).
EVMS kernel version: 1.1.0
EVMS IOCTL interface version: 10.0.0
EVMS Common Services version: 0.6.0


/proc/evms/volumes:
Enterprise Volume Management System: Volumes
major   minor          #blocks type   flags name



/proc/evms/plugins:
Enterprise Volume Management System: Plugins
 ---------Plugin----------      required services
 ----id----        version      version



############################################################
                  Data from the EVMS Engine
############################################################


./evms_gather_info: /usr/local/evms: is a directory


What should I do to get something to appear in the disks/slices/whatever
lists so I can play with it?

Thank you.

Bye,
    Oleg
