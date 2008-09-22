## ----------------------------------------------------------------------------
# cil is a Command line Issue List
# Copyright (C) 2008 Andrew Chilton
#
# This file is part of 'cil'.
#
# cil is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.
#
## ----------------------------------------------------------------------------

package CIL::Command::Precedes;

use strict;
use warnings;

use base qw(CIL::Command);

## ----------------------------------------------------------------------------

sub name { 'precedes' }

sub run {
    my ($self, $cil, $args, $issue_name, $precedes_name) = @_;

    my $issue = CIL::Utils->load_issue_fuzzy($cil, $issue_name);
    my $precedes = CIL::Utils->load_issue_fuzzy($cil, $precedes_name);

    $issue->add_precedes( $precedes->name );
    $precedes->add_depends_on( $issue->name );

    $issue->save($cil);
    $precedes->save($cil);
}

1;

## ----------------------------------------------------------------------------
