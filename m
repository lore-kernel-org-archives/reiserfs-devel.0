From: psycoco <psycoco@st-andrews.ac.uk>
Subject: atm_get_addr() & reiserfs_copy_from_user_to_file_region() problems
Date: Tue, 15 Feb 2005 15:54:32 +0000
Message-ID: <42121B38.7090703@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Transfer-Encoding: 7bit
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Some potential errors have been reported in the "atm_get_addr()" 
function in "net/atm/addr.c" and in the 
"reiserfs_copy_from_user_to_file_region()" function in "fs/reiserfs/file.c".
see
http://secunia.com/advisories/14270/

