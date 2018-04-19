<table id="permisos" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Menú</th>
                    <th>SubMenú</th>
                    <th>Permisos</th>
                </tr>
            </thead>
            <tbody>
                <?php
                foreach ($data['list'] as $it) {
                ?>
                <tr>
                    <td >
                        <a role="button" data-toggle="collapse" href="#collapse<?php echo $it->name;?>" aria-expanded="false" aria-controls="collapse<?php echo $it->name;?>" class="modal-title"><?php echo str_replace("_", " ", $it->name);?></a>
                    </td>
                    <?php if(count($it->childrens) == 0) { ?>
                    <td></td>
                    <?php } else { ?>

                    <?php } ?>
                    <td class="collapse" id="collapse<?php echo $it->name;?>">
                        <?php
                        if(count($it->childrens) > 0) {
                            foreach ($it->childrens as $c) {
                                ?>
                                <a role="button" data-toggle="collapse" href="#collapse<?php echo $c->name;?>" aria-expanded="false" aria-controls="collapse<?php echo $c->name;?>" class="modal-title"><?php echo str_replace("_", " ", $c->name);?></a><br>

                                    <div class="collapse" id="collapse<?php echo $c->name;?>">
                                        <?php
                                        foreach ($c->actions as $a) {
                                            if($a['grpactId'] == null)
                                                echo '<input type="checkbox" id="'.$a['menuAccId'].'" style="margin-left: 10%;" '.($data['read'] == true ? 'disabled="disabled"' : '').'> '.$a['actDescription'].'<br>';
                                            else
                                                echo '<input type="checkbox" id="'.$a['menuAccId'].'" style="margin-left: 10%;" '.($data['read'] == true ? 'disabled="disabled"' : '').' checked> '.$a['actDescription'].'<br>';
                                        }
                                        ?>
                                    </div>

                                <?php
                            }
                        }
                        else {
                            foreach ($it->actions as $a) {
                                if($a['grpactId'] == null)
                                    echo '<input type="checkbox" id="'.$a['menuAccId'].'" style="margin-left: 5%;" '.($data['read'] == true ? 'disabled="disabled"' : '').'> '.$a['actDescription'].'<br>';
                                else
                                    echo '<input type="checkbox" id="'.$a['menuAccId'].'" style="margin-left: 5%;" '.($data['read'] == true ? 'disabled="disabled"' : '').' checked> '.$a['actDescription'].'<br>';
                            }
                        }
                        ?>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>























